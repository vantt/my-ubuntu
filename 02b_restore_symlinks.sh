#!/bin/bash

# load configuration file
. $(dirname $0)/00_config.sh



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
