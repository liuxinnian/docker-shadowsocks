#!/bin/sh

# Set up the repository
sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  vim \
  curl

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

apt-get update

# Get Docker CE
apt-get -y install docker-ce

# Start Docker
systemctl start docker
systemctl enable docker

# Get docker-compose
curl -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Get config file
mkdir ~/docker-shadowsocks
curl -L https://raw.githubusercontent.com/liuxinnian/docker-shadowsocks/master/docker-compose.yml > ~/docker-shadowsocks/docker-compose.yml

# Pull & Start shadowsocks Server
cd ~/docker-shadowsocks
docker-compose up -d