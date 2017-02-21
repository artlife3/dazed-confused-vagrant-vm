su vagrant
umask 002

#Wordpress
mysql -u root -proot -e "CREATE DATABASE wordpress;"
cd /var/www/html/
wget https://ja.wordpress.org/wordpress-4.7.2-ja.zip
unzip wordpress-4.7.2-ja.zip

sudo chown -R apache wordpress


