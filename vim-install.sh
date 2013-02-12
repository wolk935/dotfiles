#!/bin/bash

wd=`pwd`

while [ ! -f /usr/bin/vim ]; do
	yaourt -S vim
done

ln -sin $wd/.vim/ ~/.vim
ln -si $wd/.vimrc ~/.vimrc
