#!/bin/bash

function create_user() {
	echo "Enter non-root username:"
	read username
	useradd -m -g users -G audio,games,lp,optical,power,scanner,storage,video -s /bin/bash $username
	passwd $username
}

function do_drivers() {
	echo "Select [initial] graphics driver:"
	select yn in "Nvidia" "Ati" "Intel"; do
	      case $yn in
		Nvidia ) pacman -S xf86-video-nouveua; break;;
		Ati ) pacman -S xf86-video-ati; break;;
		Intel ) pacman -S xf86-video-intel; break;;
	      esac
	done
}

function do_iptables() {
	echo "Configuring iptables"
	sh update-iptables.sh

	echo "iptables-restore < /etc/iptables/custom.rules" > /etc/rc.local
	echo "ip6tables-restore < /etc/iptables/custom_ipv6.rules" >> /etc/rc.local
}

function do_mirrorlist() {
	if [ ! -x /usr/bin/wget ]; then
		pacman -S wget
	fi

	wget --quiet -O - "https://www.archlinux.org/mirrorlist/?country=AU" | sed 's/#Server/Server/g' > /etc/pacman.d/mirrorlist
}

function do_yaourt() {
	echo "[archlinuxfr]" >> /etc/pacman.conf
	echo "SigLevel = Never" >> /etc/pacman.conf
	echo "Server = http://repo.archlinux.fr/\$arch" >> /etc/pacman.conf

	pacman -S yaourt
	yaourt -Syu `cat packages.txt`
}

do_drivers
do_iptables
do_mirrorlist
do_yaourt
create_user
