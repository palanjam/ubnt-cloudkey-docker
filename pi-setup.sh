#!/bin/sh

######
### This is the initial setup script for a Raspberry Pi 3/4 running Ubuntu server 18.04
###

apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose
git clone git://github.com/palanjam/ubnt-cloudkey-docker
cd ubnt-cloudkey-docker

### Change values in rootfs folder
docker-compose build
docker-compose up -d
