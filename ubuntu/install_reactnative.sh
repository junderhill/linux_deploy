#!/bin/bash

sudo apt-get update


# NodeJS and NPM
sudo apt install -y nodejs
sudo apt install -y npm

# Java JDK
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update

sudo apt-get install -y openjdk-8-jdk

# Watchman

cd ~/Packages
git clone https://github.com/facebook/watchman.git
cd watchman/
git checkout v4.9.0

sudo apt-get install -y autoconf automake build-essential python-dev

./autogen.sh
./configure

make

sudo make install

watchman --version

# Android Studio
cd ~/Downloads
curl https://dl.google.com/dl/android/studio/ide-zips/3.3.1.0/android-studio-ide-182.5264788-linux.zip -o android-studio.zip

sudo unzip android-studio.zip -d /opt

echo 'export PATH="$PATH:/opt/android-studio/bin"' >> ~/.bashrc
echo 'export PATH="$PATH:/opt/android-studio/bin"' >> ~/.zshrc


# React

sudo npm install -g react-native-cli

# Yeoman

sudo npm install -g yo generator-rn-toolbox

