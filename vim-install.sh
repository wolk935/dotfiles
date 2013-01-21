#!/bin/bash

wd=`pwd`

if [ ! -f $wd/setup.sh ]; then
	echo "Must execute in same working directory."
	exit
fi

while [ ! -f /usr/bin/vim ]; do
	yaourt -S vim
done

echo "Deleting defaults."
rm ~/.vim -rf
rm ~/.vimrc -f

echo "Creating symbolic links."
ln -s $wd/.vim/ ~/.vim
ln -s $wd/.vimrc ~/.vimrc
