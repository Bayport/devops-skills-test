#! /bin/bash

#install docker
curl -sSL https://get.docker.com/ | sh

#start docker
sudo systemctl start docker
sudo gpasswd -a "${USER}" docker

