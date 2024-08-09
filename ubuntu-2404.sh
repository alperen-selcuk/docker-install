#!/bin/bash

sudo apt update
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 58118A87DAD84939

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io


sudo curl -L "https://github.com/docker/compose/releases/latest/download/linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo systemctl start docker
sudo systemctl status docker


