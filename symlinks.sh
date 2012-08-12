if [ ! -f `pwd`/symlinks.sh ]
then
	echo "Must execute locally."
	exit
fi

echo "Creating symbolic links."

ln -s `pwd`/.bashrc ~/.bashrc
ln -s `pwd`/.gitconfig ~/.gitconfig
ln -s `pwd`/.profile ~/.profile
ln -s `pwd`/.vim/ ~/.vim
ln -s `pwd`/.vimrc ~/.vimrc

if [ -f /usr/bin/dwm ]
then
	ln -s `pwd`/.xsession ~/.xsession
fi
