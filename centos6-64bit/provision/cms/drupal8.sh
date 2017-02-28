su vagrant
umask 002

DRUPAL="drupal-8.2.6"

#Drupal
mysql -u root -proot -e "CREATE DATABASE drupal8;"
cd /var/www/html/
wget -q https://ftp.drupal.org/files/projects/${DRUPAL}.tar.gz
tar xvzf ${DRUPAL}.tar.gz
rm ${DRUPAL}.tar.gz

ln -s ${DRUPAL} drupal8

cd /var/www/html/drupal8
mkdir sites/default/files
sudo chmod g+w sites/default/files
cp sites/default/default.settings.php sites/default/settings.php
sudo chown -R vagrant:vagrant /var/www/html/${DRUPAL}


