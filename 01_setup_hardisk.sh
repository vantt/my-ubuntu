#!/bin/bash

# load configuration file
. $(dirname $0)/00_config.sh

# restore NTFS partition mouting
sed -e "s/\/ntfs\-data1.*$/\/ntfs\-data1     ntfs    defaults,auto,users,uid=1000,gid=1000,dmask=002,fmask=113,utf8 0 0/g" -i /etc/fstab
sed -e "s/\/ntfs\-data2.*$/\/ntfs\-data2     ntfs    defaults,auto,users,uid=1000,gid=1000,dmask=002,fmask=113,utf8 0 0/g" -i /etc/fstab

echo "System is going to reboot to load new Partition Mapping"

reboot