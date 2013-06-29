#!/bin/bash

device="sda"
bootsize="100M"

bootfs="ext2"
rootfs="ext4"

base="base base-devel syslinux"


function do_chroot() {
	arch-chroot /mnt << EOF
mkinitcpio -p linux
syslinux-install_update -i -a -m
sed -i "s/sda3/"$device"2/g" /boot/syslinux/syslinux.cfg
EOF
}

function do_formatting() {
	mkfs -t "$bootfs" /dev/"$device"1
	mkfs -t "$rootfs" /dev/"$device"2
}

function do_fstab() {
	genfstab -p /mnt >> /mnt/etc/fstab
}

function do_mount() {
	mount /dev/"$device"2 /mnt
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
