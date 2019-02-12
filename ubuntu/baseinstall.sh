#!/bin/bash

sudo apt-get update

sudo apt-get install -y vim git zsh htop slurm build-essential tmux cmake python libpython2.7-dev software-properties-common thefuck

git config --global user.email "jason@junderhill.com"
git config --global user.name "Jason Underhill"

0>/dev/null sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


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


if hash chsh >/dev/null 2>&1; then
  printf "${BLUE}Time to change your default shell to zsh!${NORMAL}\n"
  chsh -s $(grep /zsh$ /etc/shells | tail -1)
fi
exit 0
