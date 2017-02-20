su vagrant
umask 002


#Drupal
mysql -u root -proot -e "CREATE DATABASE drupal;"
cd /var/www/html/
wget https://ftp.drupal.org/files/projects/drupal-8.2.6.tar.gz
tar xvzf drupal-8.2.6.tar.gz
ln -s drupal-8.2.6 drupal

cd drupal
mkdir sites/default/files
chmod a+w sites/default/files
cp sites/default/default.settings.php sites/default/settings.php
sudo chown -R apache ../drupal


#Wordpress
mysql -u root -proot -e "CREATE DATABASE wordpress;"
cd /var/www/html/
wget https://ja.wordpress.org/wordpress-4.7.2-ja.zip
unzip wordpress-4.7.2-ja.zip
sudo chown -R apache wordpress


