umask 002


# Admin
cd /var/www/html
mkdir admin

# phpMyAdmin
git clone https://github.com/phpmyadmin/phpmyadmin.git -b STABLE
cd phpmyadmin
composer update

# Permission
cd /var/www/html
sudo chown -R vagrant:vagrant admin

