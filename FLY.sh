#!/bin/bash
yum install -y yum-utils device-mapper-persistent-data lvm2

echo "Updating and installing Docker"
yum-config-manager   --add-repo  https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce

echo "Starting and enabling Docker"
systemctl start docker
systemctl enable docker

echo "Creating database container "

docker build -t alfred .

docker run -d -p 3307:3307 --restart always --name ALFRED -v /var/lib/mysql:/var/lib/mysql alfred

result=$( docker ps -a |grep documentsrv_test  )

if [[ -n "$result" ]]; then
  echo "removing container"
  docker rm -f ALFRED
  sleep 3

  docker run -d -p 3307:3307 --restart always --name ALFRED -v /var/lib/mysql:/var/lib/mysql alfred
else
  echo "No such container"
fi

docker exec -it ALFRED mysql -u root -e "$(cat ./db.sql)"
