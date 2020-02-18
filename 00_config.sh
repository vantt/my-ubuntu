# /dev/sda1    977M EFI System  
# /dev/sda3  195,3G Ntfs        /ntfs-data1
# /dev/sda4   14,9G Linux swap
# /dev/sda5   82,3G Ext4        /
# /dev/sda6  171,9G Ext4        /ext4Data1
# /dev/sda8  195,3G Ext4        /ext4Data2
# /dev/sda9  270,9G Ntfs        /ntfs-data2

MYACCOUNT="xxx_edit_Me_xxx"

HOMEDIR="/home/$MYACCOUNT"
CONFDIR="/ext4Data1/my-ubuntu/conf"
DOCKER_DATA="/ext4Data1/docker_data"
MYCOMPUTERDIR="/ext4Data2/MyComputer"

export DEBIAN_FRONTEND="noninteractive"
