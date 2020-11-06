#!/bin/sh

# load configuration file
. $(dirname $0)/00_config.sh

# install dev base
sudo apt install -y terminator net-tools curl wget git 

# install sublime text 3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt install -y sublime-text

# install Visual Studio Code
wget -O code.deb https://update.code.visualstudio.com/latest/linux-deb-x64/stable
sudo dpkg -i code.deb

sudo apt install -y vim vim-runtime vim-doc vim-scripts apt-
transport-https software-properties-common apt-transport-https build-essential tasksel filezilla  awscli

# install Beyond Compare 4
wget -O bcompare.deb https://www.scootersoftware.com/bcompare-4.3.7.25118_amd64.deb
sudo dpkg -i bcompare.deb



# install R
#sudo apt-key adv -y --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
#sudo add-apt-repository "deb http://cran.vinastat.com/bin/linux/ubuntu trusty/"
#sudo apt update
#sudo apt install -y r-base
#sudo R -e 'install.packages(c("car", "pastecs", "psych"))'
