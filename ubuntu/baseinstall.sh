#!/bin/bash

sudo apt-get update

sudo apt-get install -y vim git zsh htop slurm build-essential tmux cmake python libpython2.7-dev software-properties-common thefuck

git config --global user.email "jason@junderhill.com"
git config --global user.name "Jason Underhill"

0>/dev/null sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


cp .zshrc $HOME/
sudo usermod -s /usr/bin/zsh $(whoami)

# Add ZSH packages that need cloning
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

mkdir $HOME/Packages

cd $HOME/Packages
git clone https://github.com/junderhill/VimConfig.git
cd VimConfig

./configureVim.sh


if hash chsh >/dev/null 2>&1; then
  printf "${BLUE}Time to change your default shell to zsh!${NORMAL}\n"
  chsh -s $(grep /zsh$ /etc/shells | tail -1)
fi
exit 0
