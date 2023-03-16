#!/bin/bash

# install packages with pacman
sudo pacman -S $(cat packages_to_install)

# Configure vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall'

# Install python modules
sudo pip install $(cat python_packages)

# Config github cli
gh auth login
