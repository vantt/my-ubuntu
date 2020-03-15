#!/bin/bash

# load configuration file
. $(dirname $0)/00_config.sh


###########################################################
#
#  Install IMPORTANT EDITORS so we can start working
# 
###########################################################

# install additional fonts
sudo apt install -y ttf-mscorefonts-installer 
sudo apt install -y ttf-bitstream-vera ttf-dejavu ttf-xfree86-nonfree

sudo apt update -y
sudo apt install -y net-tools curl wget terminator vim vim-runtime vim-doc vim-scripts apt-
transport-https   

# install language pack
sudo apt install -y language-pack-vi language-pack-vi-base language-pack-gnome-vi language-pack-gnome-vi-base

# install Vietnamese keyboard
# ibus-teni https://software.opensuse.org/download.html?project=home:vietnamese&package=ibus-teni
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/vietnamese/xUbuntu_19.10/ /' > /etc/apt/sources.list.d/ibus-teni.list"
wget -q -O - https://download.opensuse.org/repositories/home:vietnamese/xUbuntu_19.10/Release.key | sudo apt-key add -
sudo apt update
sudo apt install -y ibus-teni
sudo apt install -y ibus-unikey 


# install additional browsers (Chrome)
wget -q -O - wget https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update -y
sudo apt install -y google-chrome-stable

# install sublime text 3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt install -y sublime-text


# install extra core packages
sudo apt install -y keepassx apt-transport-https ca-certificates software-properties-common
sudo apt install -y ntfs-config cifs-utils system-config-samba 
sudo apt install -y debian-keyring ubuntu-restricted-extras gparted linux-headers-generic ubuntu-restricted-extras htop
sudo apt install -y synaptic gdebi unrar p7zip-full p7zip-rar unzip 

sudo apt upgrade -y

# install flash-player
#sudo apt install -y pepperflashplugin-nonfree
#sudo update-pepperflashplugin-nonfree --install
sudo apt install -y flashplugin-installer

# install main menu editor
sudo apt install -y alacarte unity-tweak-tool





