#!/bin/bash

# load configuration file
. $(dirname $0)/00_config.sh

cd $HOMEDIR
wget https://linux.dropbox.com/packages/ubuntu/dropbox_1.6.2_amd64.deb
sudo dpkg -i dropbox_1.6.2_amd64.deb
rm $HOMEDIR/dropbox_1.6.2_amd64.deb

# install vantt private apps
sudo apt-get install -y keepassx easytag gimp fbreader

# install variety wallpaper changer
sudo add-apt-repository -y ppa:peterlevi/ppa
sudo apt-get update
sudo apt-get install -y variety

# install VLC
sudo add-apt-repository -y ppa:videolan/stable-daily
sudo apt-get update
sudo apt-get install -y vlc

# install skype
sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update -y
sudo apt-get install -y skype && sudo apt-get -f install


# mount AFile samba share folder
#sudo mkdir /media/AFiles -p
#sudo sh -c 'echo "//192.168.68.205/AFiles  /media/AFiles cifs user=$MYACCOUNT,pass=xxxxx 0 0" >> /etc/fstab'
#sudo mount -a
