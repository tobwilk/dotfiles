#!/bin/sh

# Creates symbolic Links in your home folder, for the dotfiles in this repo

echo "Creating symbolic links"
DIR="$(cd "$(dirname "$0")" && pwd)"

echo "-> .vimrc"
ln -sf $DIR/.vimrc ~/.vimrc

echo "-> .tmux.conf"
ln -sf $DIR/.tmux.conf ~/.tmux.conf

echo "-> home folder shortcuts"
ln -sf $DIR/tmux-createnew.sh ~/tmux-createnew.sh
ln -sf $DIR/tmuxme.sh ~/tmux-attatch.sh
ln -sf $DIR/cheatsheet.md ~/cheatsheet.md
