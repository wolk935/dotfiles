#!/bin/bash

hostname="arch"

kbl="us"
locale="en_AU.UTF-8 UTF-8"
timezone="/usr/share/zoneinfo/Australia/Melbourne"


function create_nonroot_user() {
	echo "Enter non-root username:"
	read username
	useradd -m -g users -s /bin/bash $username
	passwd $username
}

function do_drivers() {
	echo "Select [initial] graphics driver:"
	select yn in "Nvidia" "Ati" "Intel"; do
	      case $yn in
		Nvidia ) pacman -Sy xf86-video-nouveua; break;;
		Ati ) pacman -Sy xf86-video-ati; break;;
		Intel ) pacman -Sy xf86-video-intel; break;;
	      esac
	done
}

function do_locale() {
	echo "$hostname" > /etc/hostname
	echo 'LANG="'"$locale"'"' > /etc/locale.conf
	echo $locale > /etc/locale.gen

	ln -s $timezone /etc/localtime

	echo "KEYMAP=$kbl" > /etc/vconsole.conf
	echo "FONT=lat9w-16" >> /etc/vconsole.conf
	echo "FONT_MAP=8859-1_to_uni" >> /etc/vconsole.conf

	locale-gen
}

function do_iptables() {
	echo "Configuring iptables"

	cp iptables.rules /etc/iptables/iptables.rules
	cp ip6tables.rules /etc/iptables/ip6tables.rules

	chmod 700 /etc/iptables/
}

function do_services() {
	systemctl enable dhcpcd.service
	systemctl enable iptables.service
	systemctl enable ip6tables.service

	chmod 700 /etc/systemd/
}

function do_packages() {
	echo "[archlinuxfr]" >> /etc/pacman.conf
	echo "SigLevel = Never" >> /etc/pacman.conf
	echo "Server = http://repo.archlinux.fr/\$arch" >> /etc/pacman.conf

	pacman -Sy yaourt
	yaourt -Syu `cat packages.txt`
}

function update_mirrorlist() {
	if [ ! -x /usr/bin/curl ]; then
		pacman -Sy curl
	fi

	curl "https://www.archlinux.org/mirrorlist/?country=AU" | sed 's/#Server/Server/g' > /etc/pacman.d/mirrorlist
}

do_locale
update_mirrorlist
do_drivers
do_iptables
do_services
do_packages
create_nonroot_user
