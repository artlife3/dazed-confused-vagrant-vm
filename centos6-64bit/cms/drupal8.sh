su vagrant
umask 002


#Drupal
mysql -u root -proot -e "CREATE DATABASE drupal;"
cd /var/www/html/
wget https://ftp.drupal.org/files/projects/drupal-8.2.6.tar.gz
tar xvzf drupal-8.2.6.tar.gz
ln -s drupal-8.2.6 drupal8

cd /var/www/html/drupal8
mkdir sites/default/files
sudo chmod a+w sites/default/files
cp sites/default/default.settings.php sites/default/settings.php
sudo chown -R apache:vagrant /var/www/html/drupal-8.2.6


