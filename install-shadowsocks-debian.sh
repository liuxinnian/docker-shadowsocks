#!/bin/sh

# Set up the repository
apt-get -y install \
  apt-transport-https \
  ca-certificates \
  vim \
  curl \
  software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

add-apt-repository \
         "deb [arch=amd64] https://download.docker.com/linux/debian \
         $(lsb_release -cs) \
         stable"

apt-get update

# Get Docker CE
apt-get -y install docker-ce

# Start Docker
systemctl start docker
systemctl enable docker

# Run Container
docker run --restart=always --name shadowsocks-libev -e PASSWORD=qlbfwlxp -p8388:8388 -p8388:8388/udp -d shadowsocks/shadowsocks-libev 
