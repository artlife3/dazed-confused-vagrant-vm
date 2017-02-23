su vagrant
umask 002

#Wordpress
mysql -u root -proot -e "CREATE DATABASE wordpress;"
cd /var/www/html/
wget -q https://ja.wordpress.org/wordpress-4.7.2-ja.zip
unzip -q wordpress-4.7.2-ja.zip
rm wordpress-4.7.2-ja.zip

sudo chown -R apache:vagrant wordpress


