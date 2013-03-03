#!/bin/bash

wd=`pwd`

while [ ! -f /usr/bin/vim ]; do
	yaourt -S vim
done

ln -si $wd/.bash_aliases ~/.bash_aliases
ln -si $wd/.bash_profile ~/.bash_profile
ln -si $wd/.bashrc ~/.bashrc
ln -si $wd/.gitconfig ~/.gitconfig
ln -si $wd/.inputrc ~/.inputrc
ln -sin $wd/.vim/ ~/.vim
ln -si $wd/.vimrc ~/.vimrc
ln -si $wd/.xinitrc ~/.xinitrc
