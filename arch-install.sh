#!/bin/bash

device="sda"
bootsize="100M"
swapsize="1024M"

bootfs="ext2"
rootfs="ext4"

base="base base-devel syslinux"


function do_chroot() {
	arch-chroot /mnt << EOF
mkinitcpio -p linux

modprobe dm-mod

grub-install --recheck --debug /dev/"$device"

mkdir -p /boot/grub/locale
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
grub-mkconfig -o /boot/grub/grub.cfg

EOF
}

function do_formatting() {
	mkfs -t "$bootfs" /dev/"$device"1
	mkswap /dev/"$device"2
	mkfs -t "$rootfs" /dev/"$device"3
}

function do_fstab() {
	genfstab -p /mnt >> /mnt/etc/fstab
}

function do_mount() {
	mount /dev/"$device"3 /mnt
	mkdir /mnt/boot
	mount /dev/"$device"1 /mnt/boot
}

function do_pacstrap() {
	pacstrap /mnt $base
}

function do_partition() {
	fdisk /dev/$device << EOF
d
1
d
2
d
n
p
1

+$bootsize
a
1
n
p
2

+$swapsize
t
2
82
n
p
3


p
w
EOF
}

function unmount() {
	umount /mnt/boot
	umount /mnt
}

do_partition
do_formatting
do_mount
do_pacstrap
do_fstab
do_chroot
unmount
