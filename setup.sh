wd=`pwd`

if [ ! -f $wd/setup.sh ]; then
	echo "Must execute locally."
	exit
fi

echo "Deleting default dotfiles..."
rm ~/.bash* -f
rm ~/.xsession* -f
rm ~/.gitconfig -f
rm ~/.profile -f
rm ~/.vim -rf
rm ~/.vimrc -f

echo "Creating symbolic links to dotfiles..."
mkdir ~/.config -p
ln -s $wd/.config/lxterminal/lxterminal.conf ~/.config/lxterminal/lxterminal.conf
ln -s $wd/.bashrc ~/.bashrc
ln -s $wd/.gitconfig ~/.gitconfig
ln -s $wd/.profile ~/.profile
ln -s $wd/.vim/ ~/.vim
ln -s $wd/.vimrc ~/.vimrc

echo "Install dwm?"
select yn in "Yes" "No"; do
	if [ ! $yn == "Yes" ]; then
		break
	fi

	if [ ! -f /usr/bin/abs ]; then
		yaourt -S abs
	fi
	if [ ! -f /usr/bin/dmenu ]; then
		yaourt -S dmenu
	fi

	echo "Downloading dwm..."
	sudo abs community/dwm
	cp -r /var/abs/community/dwm ~/workspace/dwm

	echo "Compiling dwm..."
	cd ~/workspace/dwm
	makepkg -i

	echo "Configuring dwm..."
	rm ~/workspace/dwm/config.h -f
	ln -s $wd/dwm-config.h ~/workspace/dwm/config.h

	chmod +x $wd/.xsession
	ln -s $wd/.xsession ~/.xsession

	echo "Recompiling dwm..."
	makepkg -g >> PKGBUILD
	makepkg -efi

	break
done

echo "Setup SSH keys?"
select yn in "Yes" "No"; do
	if [ ! $yn == "Yes" ]; then
		break
	fi

	if [ ! -f /usr/bin/ssh-keygen ]; then
		yaourt -S openssh
	fi

	echo "Detected SSH, setting up keys..."
	mkdir ~/.ssh -p
	cd ~/.ssh

	echo "Enter ssh-keygen email:"
	read sshemail
	ssh-keygen -t rsa -C $sshemail

	break
done
