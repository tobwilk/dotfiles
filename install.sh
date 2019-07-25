#!/bin/bash

# Bootstrap a vanilla ubuntu machine

# Update the machine
echo "Updating machine"
sudo apt-get update -y
sudo apt-get upgrade -y

# Install core tools
echo "Installing tools"
sudo apt-get install -y vim git tree tmux
sudo apt-get install -y python-pip python3-pip

# configure git 
echo "Configuring git"
git config --global user.name "Toby W"
git config --global user.email "foo@bar.com"

# Pull the git submodules
#echo "Pulling git submodules"
#git submodule init
#git submodule update

#symlink config files
echo "Creating symlinks"
DIR="$(cd "$(dirname "$0")" && pwd)"
ln -sf $DIR/.vimrc ~/.vimrc
ln -sfn $DIR/.vim ~/.vim
ln -sf $DIR/.tmux.conf ~/.tmux.conf

ln -sf $DIR/tmux-createnew.sh ~/tmux-createnew.sh
ln -sf $DIR/tmuxme.sh ~/tmux-attatch.sh

ln -sf $DIR/cheatsheet.md ~/cheatsheet.md

# install aliases
echo "Adding bashrc aliases"
./aliases.sh

echo "Sourcing files"
tmux source ~/.tmux.conf
source ~/.bashrc

echo "!! DONE !!"
# Now go into a tmux session, eg with 'tmux new -s main'
