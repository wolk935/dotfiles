#!/bin/bash

wd=`pwd`

ln -si $wd/.bash_aliases ~/.bash_aliases
ln -si $wd/.bash_profile ~/.bash_profile
ln -si $wd/.bashrc ~/.bashrc
ln -si $wd/.gitconfig ~/.gitconfig
ln -si $wd/.inputrc ~/.inputrc
ln -sin $wd/.vim/ ~/.vim
ln -si $wd/.vimrc ~/.vimrc
ln -si $wd/.xinitrc ~/.xinitrc
