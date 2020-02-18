#!/bin/sh

# load configuration file
. $(dirname $0)/00_config.sh

# install dev base
sudo apt install -y apt-transport-https build-essential tasksel curl wget filezilla git awscli

# install Visual Studio Code
sudo apt install -y apt-transport-https
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt -y update
sudo apt -y install code # or code-insiders

# install JAVA
sudo apt install openjdk-11-jre-headless

# install Vagrant && VirtualBox
sudo apt install -y virtualbox virtualbox-guest-additions-iso vagrant
sudo adduser $MYACCOUNT vboxusers

# install R
#sudo apt-key adv -y --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
#sudo add-apt-repository "deb http://cran.vinastat.com/bin/linux/ubuntu trusty/"
#sudo apt update
#sudo apt install -y r-base
#sudo R -e 'install.packages(c("car", "pastecs", "psych"))'
