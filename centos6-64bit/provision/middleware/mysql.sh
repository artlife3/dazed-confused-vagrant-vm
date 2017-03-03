#MySQL
echo "---------- MySQL ----------"

yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
yum -y install mysql-community-server

sudo mkdir /var/log/mysqld
sudo touch /var/log/mysqld/error.log
sudo touch /var/log/mysqld/slow_query.log
sudo chown -R mysql:vagrant /var/log/mysqld

chkconfig mysqld on
service mysqld start

sudo sed -i -e 's/log-error=\/var\/log\/mysqld.log/log-error=\/var\/log\/mysqld\/error.log/g' /etc/my.cnf


mysql -u root -e "UPDATE mysql.user SET Password=PASSWORD('root') WHERE User='root';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* to user@\"%\" IDENTIFIED BY 'password' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"


