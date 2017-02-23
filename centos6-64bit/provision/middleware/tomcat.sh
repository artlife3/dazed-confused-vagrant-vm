# Tomcat
sudo useradd -s /sbin/nologin tomcat

wget -q http://ftp.kddilabs.jp/infosystems/apache/tomcat/tomcat-8/v8.5.11/bin/apache-tomcat-8.5.11.tar.gz

tar xvzf apache-tomcat-8.5.11.tar.gz
rm apache-tomcat-8.5.11.tar.gz
sudo  mkdir /opt/tomcat
sudo  mv /home/vagrant/apache-tomcat-8.5.11 /opt/tomcat

cat << EOT >> /etc/profile
JRE_HOME=/usr/java/default
CATALINA_HOME=/opt/tomcat/apache-tomcat-8.5.11
export JRE_HOME CATALINA_HOME
EOT
cat << EOT > /opt/tomcat/apache-tomcat-8.5.11/conf/tomcat-users.xml
<?xml version="1.0" encoding="UTF-8"?>

<tomcat-users xmlns="http://tomcat.apache.org/xml"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
              version="1.0">

<role rolename="manager-gui"/>
<role rolename="admin-gui"/>
<user username="tomcat" password="tomcat" roles="manager-gui,admin-gui"/>

</tomcat-users>
EOT

sudo chown -R tomcat:vagrant /opt/tomcat
sudo chmod -R g+rw /opt/tomcat
sudo find /opt/tomcat -type d -exec chmod g+x {} \;

sudo cat << EOT >> /opt/tomcat/apache-tomcat-8.5.11/conf/Catalina/localhost/manager.xml
<Context privileged="true" antiResourceLocking="false" docBase="\${catalina.home}/webapps/manager">
<Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="^.*$" /></Context>
EOT


sudo -u tomcat /opt/tomcat/apache-tomcat-8.5.11/bin/startup.sh

cat << EOT > /etc/httpd/conf.d/tomcat.conf
<VirtualHost *:80>
  ServerName tomcat.vagrant-vm.dev

  <Directory />
    Options FollowSymLinks
    AllowOverride None
    ProxyPass  ajp://localhost:8009/
    ProxyPassReverse ajp://localhost:8009/
  </Directory>

</VirtualHost>
EOT

sudo /etc/init.d/httpd restart

