#!/bin/sh

# load configuration file
. $(dirname $0)/00_config.sh

###########################################################
#
#  ADD NEW LOOPBACK ADDRESS
# 
###########################################################

ip addr add 10.254.254.254/24 dev lo
cp -f /etc/netplan/01-network-manager-all.yaml /etc/netplan/01-network-manager-all.yaml.bak
cp ${CONFDIR}/etc/netplan/01-network-manager-all.yaml /etc/netplan/01-network-manager-all.yaml

###########################################################
#
#  INSTALL LOCAL DNS SYSTEM
# 
###########################################################

sudo apt install -y net-tools

# MYIP=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(192\.168\.[0-9]*\.[0-9]*).*/\2/p' | head -n1)
MYIP="10.254.254.254"
echo "MyIP: $MYIP"

# install dnsmasq as docker-container
docker pull andyshinn/dnsmasq:2.78

docker network create --driver=bridge --subnet=172.21.0.0/16 --gateway=172.21.0.1 https-proxy

# disable systemd-resolved DNS
sudo sed -e "s/^#\?DNSStubListener.*/DNSStubListener=no/g" -i /etc/systemd/resolved.conf
sudo systemctl restart systemd-resolved.service

docker stop dnsmasq
docker rm dnsmasq

docker run -d --restart=always --name=dnsmasq --network=https-proxy --cap-add=NET_ADMIN \
      -p 127.0.0.53:53:53/tcp -p 127.0.0.53:53:53/udp \
      -p 127.0.0.1:53:53/tcp -p 127.0.0.1:53:53/udp \
      -p $MYIP:53:53/tcp -p $MYIP:53:53/udp \
      andyshinn/dnsmasq:2.78 --address=/mio/$MYIP --server=8.8.8.8 --server=8.8.4.4
