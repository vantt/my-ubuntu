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


# make sure inotify is enough for JetBrains products
# sed -i '/^FOOBAR=/{h;s/=.*/=newvalue/};${x;/^$/{s//FOOBAR=newvalue/;H};x}' infile
sudo sed -i '/^fs\.inotify\.max_user_watches=/{h;s/=.*/=524288/};${x;/^$/{s//fs\.inotify\.max_user_watches=524288/;H};x}' /etc/sysctl.conf
sudo sysctl -p --system
