<?php

$aliases['m1'] = array(
  'remote-host'  => '202.43.109.230',
  'remote-user'  => 'bocvac',
  'ssh-options'  => '-p 6879',
  'path-aliases' => array(
     '%drush'         => '/home/bocvac/.drush/drush',
     '%drush-script'  => '/home/bocvac/.drush/drush/drush',
     '%dump-dir'      => '/home/bocvac/.drush/dump',
   ),
);

$aliases['live'] = array(
  'parent' => '@m1',
  'uri'    => 'www.anphabe.com',
  'root'   => '/home/apage/anphabe/html',
);

$aliases['stag'] = array(
  'parent' => '@m1',
  'uri'    => 'stag.anphabe.com',
  'root'   => '/home/apage/stag/html',
);

$aliases['dev'] = array(
  'uri'    => 'dev.anphabe.net',
  'root'   => '/home/www/anphabe/html',
  'remote-host'  => '192.168.68.201',
  'remote-user'  => 'upload',
  'ssh-options'  => '-p 22',
  'path-aliases' => array(
     '%drush'         => '/home/upload/.drush/drush',
     '%drush-script'  => '/home/upload/.drush/drush/drush',
     '%dump-dir'      => '/home/upload/.drush/drush/dump',
   ),
);

$aliases['local'] = array(
  'uri'    => 'anphabe.dev',
  //'root'   => '/data/www/anpha/mio/code',
'root' => '/ext4Data1/dev/lamp2/docker_web/apache2/www/anpha/mio/code',
//'remote-host'  => '172.17.0.2',
//'remote-user'  => 'root',
  'path-aliases' => array(
     # the folder which drush was installed
     #'%drush'         => '/usr/share/php/drush',

     # The path to the 'drush' script, or to 'drush.php' or 'drush.bat', as desired.  
     # This is used by backend invoke when drush runs a drush command.  
     # The default is 'drush' on remote machines, or the full path to drush.php on the local machine.
     #'%drush-script'  => '/usr/share/php/drush/drush.php',

     # Path to directory that "drush sql-sync" should use to store sql-dump files 
     #'%dump-dir'      => '/data/tmp/.drush',
   ),

);

$aliases['survey'] = array(
  'uri'    => 'survey2014.dev',
  'root'   => '/data/www/domains.dev/survey2014',

  'remote-host'  => '172.17.0.2',
  'remote-user'  => 'root',
  'path-aliases' => array(
     # the folder which drush was installed
     #'%drush'         => '/usr/share/php/drush',

     # The path to the 'drush' script, or to 'drush.php' or 'drush.bat', as desired.  
     # This is used by backend invoke when drush runs a drush command.  
     # The default is 'drush' on remote machines, or the full path to drush.php on the local machine.
     #'%drush-script'  => '/usr/share/php/drush/drush.php',

     # Path to directory that "drush sql-sync" should use to store sql-dump files 
     #'%dump-dir'      => '/data/tmp/.drush',
   ),

);

