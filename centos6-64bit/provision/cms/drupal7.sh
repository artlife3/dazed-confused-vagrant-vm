su vagrant
umask 002

DRUPAL="drupal-7.54"

#Drupal
mysql -u root -proot -e "CREATE DATABASE drupal7;"
cd /var/www/html/
wget -q https://ftp.drupal.org/files/projects/${DRUPAL}.tar.gz
tar xvzf ${DRUPAL}.tar.gz
rm ${DRUPAL}.tar.gz

ln -s ${DRUPAL} drupal7

cd /var/www/html/drupal7
mkdir sites/default/files
sudo chmod g+w sites/default/files
cp sites/default/default.settings.php sites/default/settings.php
sudo chown -R apache:vagrant /var/www/html/${DRUPAL}

cd profiles/standard/translations
wget -q http://ftp.drupal.org/files/translations/7.x/drupal/${DRUPAL}.ja.po

