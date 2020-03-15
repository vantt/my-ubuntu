#!/bin/sh

# load configuration file
. $(dirname $0)/00_config.sh

# install dev base
sudo apt install -y software-properties-common apt-transport-https build-essential tasksel curl wget filezilla git awscli

# install Visual Studio Code
wget -O code.deb https://update.code.visualstudio.com/latest/linux-deb-x64/stable
sudo dpkg -i code.deb

# install Beyond Compare 4
wget -O bcompare.deb https://www.scootersoftware.com/bcompare-4.3.4.24657_amd64.deb
sudo dpkg -i bcompare.deb

# install JAVA
sudo apt install -y openjdk-11-jre-headless

# install Vagrant && VirtualBox
sudo apt install -y virtualbox virtualbox-guest-additions-iso vagrant
sudo adduser $MYACCOUNT vboxusers

# install R
#sudo apt-key adv -y --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
#sudo add-apt-repository "deb http://cran.vinastat.com/bin/linux/ubuntu trusty/"
#sudo apt update
#sudo apt install -y r-base
#sudo R -e 'install.packages(c("car", "pastecs", "psych"))'
