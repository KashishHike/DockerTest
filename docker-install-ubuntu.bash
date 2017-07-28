#!/bin/bash
sudo sed -i -e 's/:\/\/(archive.ubuntu.com\|security.ubuntu.com)/old-releases.ubuntu.com/g' /etc/apt/sources.list
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates
sudo apt-get -y install aufs-tools
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c "echo deb https://apt.dockerproject.org/repo ubuntu-trusty main\ > /etc/apt/sources.list.d/docker.list"
sudo sed -i -e 's/:\/\/(archive.ubuntu.com\|security.ubuntu.com)/old-releases.ubuntu.com/g' /etc/apt/sources.list
sudo apt-get update
sudo apt-get -y install linux-image-extra-$(uname -r)
sudo apt-get -y install apparmor
sudo apt-get purge lxc-docker
sudo apt-get -y install docker-engine
sudo service docker start
sudo sh -c "echo \"DOCKER_OPTS='--log-driver=json-file --log-opt max-size=25m --log-opt max-file=2'\" > /etc/default/docker"
sudo service docker restart
