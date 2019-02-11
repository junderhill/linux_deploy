#!/bin/bash

sudo apt-get update

sudo apt-get install -y vim git zsh htop slurm build-essential tmux cmake libpython2.7-dev software-properties-common

git config --global user.email "jason@junderhill.com"
git config --global user.name "Jason Underhill"

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp .zshrc $HOME/
sudo usermod -s /usr/bin/zsh $(whoami)

mkdir $HOME/Packages

cd $HOME/Packages
git clone https://github.com/junderhill/VimConfig.git
cd VimConfig

./configureVim.sh

# Ruby and RVM

sudo apt-add-repository -y ppa:rael-gc/rvm

sudo apt-get update
sudo apt-get install -y rvm

source /etc/profile.d/rvm.sh
source ~/.bashrc
sudo usermod -aG rvm ${USERNAME}

