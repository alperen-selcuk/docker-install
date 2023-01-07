#!/bin/bash

#ubuntu üzerine docker ve docker-compose kurmak için gerekli script.

sudo apt-get update -y && apt-get upgrade -y

sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gnupg \
    lsb-release \
    gnupg2 \
    pass

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update -y

sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo apt-get -y install docker-compose

sudo usermod -aG docker $USER

sleep 3

sudo systemctl start docker

sudo systemctl enable docker


