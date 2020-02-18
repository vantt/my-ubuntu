#!/bin/bash

# load configuration file
. $(dirname $0)/00_config.sh

# restore the bash environments
if [ ! -e "$HOMEDIR/bash_vantt" ]; then
  ln -s $CONFDIR/bash_vantt $HOMEDIR/bash_vantt
  echo "if [ -f ~/bash_vantt ]; then" >> $HOMEDIR/.bashrc
  echo "    . ~/bash_vantt" >> $HOMEDIR/.bashrc
  echo "fi" >> $HOMEDIR/.bashrc
fi

# restore hosts file
sudo cp /etc/hosts $CONFDIR/etc/hosts.backup -f
sudo rm /etc/hosts -f
sudo ln -s $CONFDIR/etc/hosts /etc/hosts

# restore public key
if [ ! -d $HOMEDIR/.ssh/ ]; then
  mkdir $HOMEDIR/.ssh/
fi

sudo cp $CONFDIR/ssh/* $HOMEDIR/.ssh/ -f
sudo chown $MYACCOUNT:$MYACCOUNT $HOMEDIR/.ssh -R
sudo chmod 600 $HOMEDIR/.ssh/*
rm $HOMEDIR/.ssh/known_hosts


# restore symlinks
rm $HOMEDIR/Documents -rf
ln -s $MYCOMPUTERDIR/Documents $HOMEDIR/Documents

rm $HOMEDIR/Downloads -rf
ln -s $MYCOMPUTERDIR/Downloads $HOMEDIR/Downloads

rm $HOMEDIR/Dropbox -rf
ln -s $MYCOMPUTERDIR/Dropbox $HOMEDIR/Dropbox

rm $HOMEDIR/Music -rf
rm $HOMEDIR/Musics -rf
ln -s $MYCOMPUTERDIR/Media/Musics $HOMEDIR/Musics

rm $HOMEDIR/Videos -rf
ln -s $MYCOMPUTERDIR/Media/Videos $HOMEDIR/Videos

rm $HOMEDIR/Pictures -rf
ln -s $MYCOMPUTERDIR/Media/Pictures $HOMEDIR/Pictures
 
rm $HOMEDIR/.PyCharm30 -rf
ln -s $CONFDIR/software-configs/.PyCharm30 $HOMEDIR/.PyCharm30

rm $HOMEDIR/.WebIde90 -rf
ln -s $CONFDIR/software-configs/.WebIde90 $HOMEDIR/.WebIde90

rm $HOMEDIR/.VirtualBox -ff
ln -s $CONFDIR/software-configs/.VirtualBox $HOMEDIR/.VirtualBox


# make sure inotify is enough for JetBrains products
# sed -i '/^FOOBAR=/{h;s/=.*/=newvalue/};${x;/^$/{s//FOOBAR=newvalue/;H};x}' infile
sudo sed -i '/^fs\.inotify\.max_user_watches=/{h;s/=.*/=524288/};${x;/^$/{s//fs\.inotify\.max_user_watches=524288/;H};x}' /etc/sysctl.conf
sudo sysctl -p --system