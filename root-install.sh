#!/bin/bash

# mirrors
echo "Setting up mirrors"
wget -qO - "https://www.archlinux.org/mirrorlist/?country=AU&protocol=ftp&protocol=http&user_mirror_status=on" | sed 's/#Server/Server/g' > /etc/pacman.d/mirrorlist

# yaourt
echo "Installing yaourt"
echo "[archlinuxfr]" >> /etc/pacman.conf
echo "Server = http://repo.archlinux.fr/$arch" >> /etc/pacman.conf
pacman -S yaourt

# custom packages
echo "Installing custom packages"
yaourt -Syu `cat packages.txt`

# iptables configuration
echo "Configuring iptables"
sh update-iptables.sh

echo "iptables-restore < /etc/iptables/custom.rules" >> /etc/rc.local
echo "ip6tables-restore < /etc/iptables/custom_ipv6.rules" >> /etc/rc.local

# graphics drivers
echo "Select [initial] graphics driver:"
select yn in "Nvidia" "Ati"; do
	case $yn in
		Nvidia ) yaourt -S xf86-video-nouveua; break;;
		Ati ) yaourt -S xf86-video-ati; break;;
	esac
done

echo "Manual configuration mode (visudo):"
visudo

echo "Enter non-root username:"
read username
useradd -m -g users -G audio,games,lp,optical,power,scanner,storage,video -s /bin/bash $username
passwd $username
