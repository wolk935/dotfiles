#!/bin/bash

wd=`pwd`

if [ ! -f $wd/setup.sh ]; then
	echo "Must execute in same working directory."
	exit
fi

echo "Deleting defaults."
rm ~/.bash* -f
rm ~/.gitconfig -f
rm ~/.profile -f

echo "Creating symbolic links."
ln -s $wd/.bashrc ~/.bashrc
ln -s $wd/.gitconfig ~/.gitconfig
ln -s $wd/.profile ~/.profile
