echo "Downloading Arch-Linux install script"
wget arch.mario-aichinger.at/install.sh

echo "Running Arch-Linux install script"
sh install.sh

echo "[archlinuxfr]" >> pacman.conf
echo "Server = http://repo.archlinux.fr/$arch" >> pacman.conf

pacman -S yaourt

tmpfile=$(mktemp --suffix=-mirrorlist)
wget -qO- "https://www.archlinux.org/mirrorlist/?country=AU&protocol=ftp&protocol=http&ip_version=4&ip_version=6&user_mirror_status=on" | sed 's/#Server/Server/g' > "$tmpfile"
mv -i "$tmpfile" /etc/pacman.d/mirrorlist

echo "Installing custom packages"
yaourt -Syu `echo packages.txt`

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
