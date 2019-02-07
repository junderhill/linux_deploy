#!/bin/bash

apt-get update
apt-get install -y curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable edge"
apt-get install -y docker-ce
systemctl status docker
usermod -aG docker ${USERNAME}

