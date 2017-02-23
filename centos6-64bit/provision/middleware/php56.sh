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
php-mcrypt

# PECL
sudo yum install -y --enablerepo=remi,remi-php56 \
php-opcache \
php-pecl-memcache \
php-pecl-memcached \
php-pecl-apcu \
php-pecl-xdebug

sudo sed -i -e "/AddType text\/html \.php/i\AddType application\/x-httpd-php \.php \.html" /etc/httpd/conf.d/php.conf

# Error log
sudo mkdir -p /var/log/php/
sudo touch /var/log/php/php_errors.log
sudo chown -R apache:apache /var/log/php/
sudo sed -i -e "s/\;error_log = php_errors.log/error_log = \/var\/log\/php\/php_errors.log/g" /etc/php.ini
cat << EOT > /etc/logrotate.d/php
/var/log/php/php_errors.log
    missingok
    notifempty
    sharedscripts
    delaycompress
    postrotate
        /sbin/service httpd reload > /dev/null 2>/dev/null || true
    endscript
}
EOT

sudo /etc/init.d/httpd restart

# Composer
cd ~/
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

