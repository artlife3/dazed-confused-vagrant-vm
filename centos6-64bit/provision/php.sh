#PHP
sudo yum -y install epel-release
sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

sudo yum install -y --enablerepo=remi,remi-php56 php \
php-cli \
php-common \
php-devel \
php-gd \
php-intl \
php-mbstring \
php-pdo \
php-mysqlnd \
php-pear \ 
php-xml \
php-mcrypt \
php-opcache

# PECL
sudo yum install -y --enablerepo=remi,remi-php56 \
php-pecl-memcached \
php-pecl-memcache \
php-pecl-apcu \
php-pecl-xdebug

sudo sed -i -e "/AddType text\/html \.php/i\AddType application\/x-httpd-php \.php \.html" /etc/httpd/conf.d/php.conf
sudo /etc/init.d/httpd restart

# Composer
cd ~/
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

