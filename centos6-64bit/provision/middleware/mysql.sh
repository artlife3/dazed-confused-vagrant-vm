#MySQL
yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
yum -y install mysql-community-server

chkconfig mysqld on
service mysqld start

mysql -u root -e "UPDATE mysql.user SET Password=PASSWORD('root') WHERE User='root';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* to user@\"%\" IDENTIFIED BY 'password' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"


