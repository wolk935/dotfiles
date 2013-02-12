#!/bin/bash

echo "Downloading Arch-Linux install script"
#TODO gist.github.com/3794408
wget arch.mario-aichinger.at/install.sh

echo "Running Arch-Linux install script"
sh install.sh

# yaourt
echo "Installing yaourt"
echo "[archlinuxfr]" >> /etc/pacman.conf
echo "Server = http://repo.archlinux.fr/$arch" >> /etc/pacman.conf
pacman -S yaourt

# mirrors
echo "Setting up mirrors"
wget -qO- "https://www.archlinux.org/mirrorlist/?country=AU&protocol=ftp&protocol=http&user_mirror_status=on" | sed 's/#Server/Server/g' > /etc/pacman.d/mirrorlist

# custom packages
echo "Installing custom packages"
yaourt -Syu `cat packages.txt`

# graphics drivers
echo "Select [initial] graphics driver:"
select yn in "Nvidia" "Ati"; do
	case $yn in
		Nvidia ) yaourt -S xf86-video-nouveua; break;;
		Ati ) yaourt -S xf86-video-ati; break;;
	esac
done

echo "Enter non-root username:"
read username
useradd -m -g users -G audio,games,lp,optical,power,scanner,storage,video -s /bin/bash $username
passwd $username

#TODO: Automate the following section
echo "Manual configuration mode (visudo, rc.conf, inittab):"
visudo

vi /etc/rc.conf
vi /etc/inittab
