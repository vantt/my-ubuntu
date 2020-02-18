#!/bin/sh

# load configuration file
. $(dirname $0)/00_config.sh

# install JAVA
sudo apt-get install -y build-essential tasksel 
sudo apt-get install -y openjdk-8-jre

# install mysql
sudo apt-get install -y mysql-server mysql-client mysql-dev

# change mysql data folder
sudo service mysql stop
sudo mv /var/lib/mysql /var/lib/mysql_bk
sudo ln -s /ext4Data1/mysql /var/lib/mysql
sudo chown -h mysql:mysql /var/lib/mysql
sudo sed -e "s/^#include \<local\/usr\.sbin\.mysqld\>/include \<local\/usr\.sbin\.mysqld\>/g" -i /etc/apparmor.d/usr.sbin.mysqld
sudo echo "$MYSQLDATA/ r," >> /etc/apparmor.d/local/usr.sbin.mysqld
sudo echo "$MYSQLDATA/** rwk," >>  /etc/apparmor.d/local/usr.sbin.mysqld
sudo service apparmo restart
sudo service mysql start

# install apache
sudo apt-get install -y apache2 libapache2-mod-xsendfile
sudo usermod --append --groups $MYACCOUNT www-data
sudo usermod --append --groups www-data $MYACCOUNT
sudo a2enmod rewrite
sudo a2enmod vhost_alias
sudo a2enmod xsendfile

# restore apache config
sudo cp /etc/apache2/sites-available/000-default.conf $CONFDIR/etc/apache2/sites-available/000-default.conf.backup -f
sudo cp /etc/apache2/sites-available/default-ssl.conf $CONFDIR/etc/apache2/sites-available/default-ssl.conf.backup -f
sudo rm /etc/apache2/sites-available -rf
sudo rm /etc/apache2/sites-enabled -rf
sudo ln -s $CONFDIR/etc/apache2/sites-available /etc/apache2/sites-available
sudo ln -s $CONFDIR/etc/apache2/sites-enabled /etc/apache2/sites-enabled
sudo mv /etc/logrotate.d/apache2 $CONFDIR/etc/logrotate.d/apache2.origin
sudo cp $CONFDIR/etc/logrotate.d/apache2 /etc/logrotate.d/apache2
sudo service apache2 restart

# install php
sudo apt-get install -y php5 php-pear php5-dev 
sudo apt-get install -y php5-json
sudo apt-get install -y php5-imagick php5-imap php5-intl php5-mcrypt php5-memcached php5-mongo php5-xdebug php5-curl
sudo pear channel-update

# install pear
sudo pear channel-discover pear.phing.info -y
sudo pear clear-cache -y
sudo pear install phing/phing

# install drush
sudo pear upgrade --force Console_Getopt
sudo pear upgrade --force Console_Table
sudo pear upgrade --force pear
sudo pear channel-discover pear.drush.org
sudo pear install drush/drush -y
sudo drush dl drush --destination='/usr/local/share' -y
sudo ln -s /usr/local/share/drush/drush /usr/local/bin/drush
sudo mkdir -p $HOME/.drush
sudo chown $MYACCOUNT:$MYACCOUNT $HOME/.drush
sudo rm $HOME/.drush/anfa.aliases.drushrc.php -f
sudo ln -s $CONFDIR/etc/drush/anfa.aliases.drushrc.php $HOME/.drush/anfa.aliases.drushrc.php

# install composer
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/bin --filename=composer

# install phpmyadmin
sudo apt-get install -y phpmyadmin
sudo ln -s $CONFDIR/etc/phpmyadmin/additional_servers.inc.php /etc/phpmyadmin/conf.d/additional_servers.inc.php

# install Vagrant
sudo apt-get install -y vagrant 

# install dnsmasq
sudo apt-get install -y dnsmasq
sudo sed -e "s/^#conf-dir/conf-dir/g" -i /etc/dnsmasq.conf
sudo ln -s $CONFDIR/etc/dnsmasq/dynamic-subdomains.conf /etc/dnsmasq.d/dynamic-subdomains.conf
sudo sed -e "s/files mdns4_minimal \[NOTFOUND\=return\] dns mdns4/files dns mdns4_minimal \[NOTFOUND\=return\] mdns4/g" -i /etc/nsswitch.conf
sudo service dnsmasq restart

# install memcached
sudo apt-get install -y memcached

# install beanstalkd
sudo apt-get install -y beanstalkd 
sudo sed -e "s/^#START/START/g" -i /etc/default/beanstalkd

# install nodejs
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y python-software-properties python g++ make
sudo apt-get install -y nodejs 
