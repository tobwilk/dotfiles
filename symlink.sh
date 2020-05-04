#!/bin/sh

# Creates symbolic Links in your home folder, for the dotfiles in this repo

echo "Creating symbolic links"
DIR="$(cd "$(dirname "$0")" && pwd)"

echo "-> .vimrc"
ln -sf $DIR/.vimrc ~/.vimrc

#echo "-> .tmux.conf"
#ln -sf $DIR/.tmux.conf ~/.tmux.conf
