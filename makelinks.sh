#!/bin/bash
# Author: Sarp Orgul
# File: makelinks.sh
# ------------------
# Script for managing dotfiles

dir=~/dotfiles
olddir=~/dotfiles_old
files="vimrc zshrc xinitrc Xresources config/conky/conky.conf config/bspwmrc config/polybar/config config/sxhkd/sxhkdrc config/compton.conf"

# make scripts executable
# sudo chmod +x scripts/*

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

echo "Configuring Neovim"
	ln -s ~/.vim ~/.config/nvim
	ln -s ~/.vimrc ~/.config/nvim/init.vim
