#!/bin/sh

# load configuration file
. $(dirname $0)/00_config.sh

###########################################################
#
#  Install DOCKER COMMUNITY EDITION
# 
###########################################################

# clean up
sudo apt remove -y docker docker-engine docker.io

# install Docker Repository
sudo apt install -y net-tools apt-transport-https ca-certificates curl software-properties-common
curl -fsSL get.docker.com | sudo sh
sudo adduser $MYACCOUNT docker

# setup Default Config and User
sudo systemctl stop docker
sudo rm /var/lib/docker -rf
sudo ln -s $DOCKER_DATA /var/lib/docker
sudo mv /etc/docker/daemon.json /etc/docker/daemon.json.origin
sudo ln -s $CONFDIR/etc/docker/daemon.json /etc/docker/daemon.json
sudo systemctl restart docker

docker context create registry --docker "host=ssh://ubuntu@192.168.3.47"


# install Docker Compose
# https://github.com/docker/compose/releases
sudo rm /usr/bin/docker-compose -f
sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# https://github.com/docker/machine/releases
sudo curl -L https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-machine
sudo chmod +x /usr/local/bin/docker-machine
