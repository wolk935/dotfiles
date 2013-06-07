#!/bin/bash

hostname="arch"

kbl="us"
locale="en_AU.UTF-8 UTF-8"
timezone="/usr/share/zoneinfo/Australia/Melbourne"

device="sda"
bootsize="100M"
swapsize="1024M"

bootfs="ext2"
rootfs="ext3"

base="base base-devel grub-bios"

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

function do_formatting() {
	mkfs -t "$bootfs" /dev/"$device"1
	mkswap /dev/"$device"2
	mkfs -t "$rootfs" /dev/"$device"3
}

function do_mount() {
	mount /dev/"$device"3 /mnt
	mkdir /mnt/boot
	mount /dev/"$device"1 /mnt/boot
}

function do_pacstrap() {
	pacstrap /mnt $base
}

function do_fstab() {
	genfstab -p /mnt >> /mnt/etc/fstab
}

function do_chroot() {
	echo "$hostname" > /mtn/etc/hostname
	echo 'LANG="'"$locale"'"' > /mnt/etc/locale.conf
	echo $locale > /mnt/etc/locale.gen
	
	echo "Timezone"
	ln -s $timezone /mnt/etc/localtime

	echo "Keyboard Layout"
	echo "KEYMAP=$kbl" > /mnt/etc/vconsole.conf
	echo "FONT=lat9w-16" >> /mnt/etc/vconsole.conf
	echo "FONT_MAP=8859-1_to_uni" >> /mnt/etc/vconsole.conf

	arch-chroot /mnt << EOF
echo "Locale"
locale-gen

echo "mkinitcpio -p linux..."
mkinitcpio -p linux

echo "Starting dm-mod..."
modprobe dm-mod

echo "Install and configure GRUB..."
grub-install --recheck --debug /dev/"$device"

mkdir -p /boot/grub/locale
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
grub-mkconfig -o /boot/grub/grub.cfg

passwd

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
