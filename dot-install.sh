#!/bin/bash

wd=`pwd`

if [ ! -f $wd/setup.sh ]; then
	echo "Must execute in same working directory."
	exit
fi

echo "Deleting defaults."
rm ~/.bash* -f
rm ~/.gitconfig -f

echo "Creating symbolic links."
ln -s $wd/.bashrc ~/.bashrc
ln -s $wd/.bash_profile ~/.bash_profile
ln -s $wd/.gitconfig ~/.gitconfig
ln -s $wd/.xinitrc ~/.xinitrc
