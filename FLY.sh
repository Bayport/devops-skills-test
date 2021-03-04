#! /bin/bash

export MYSQL_ROOT_PASSWORD=$$MYSQL_ROOT_PASSWORD
docker-compose up

#install docker
#curl -sSL https://get.docker.com/ | sh

#start docker
#sudo systemctl start docker
#sudo gpasswd -a "${USER}" docker

