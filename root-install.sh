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
		Nvidia ) pacman -Sy xf86-video-nouveua; break;;
		Ati ) pacman -Sy xf86-video-ati; break;;
		Intel ) pacman -Sy xf86-video-intel; break;;
	      esac
	done
}

function do_iptables() {
	echo "Configuring iptables"
	systemctl enable iptables.service
	systemctl enable ip6tables.service

	./iptables.sh
}

function do_yaourt() {
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

update_mirrorlist
do_drivers
do_iptables
do_yaourt
create_user
