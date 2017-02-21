# Tomcat
sudo useradd -s /sbin/nologin tomcat
wget http://ftp.kddilabs.jp/infosystems/apache/tomcat/tomcat-8/v8.5.11/bin/apache-tomcat-8.5.11.tar.gz
tar xvzf apache-tomcat-8.5.11.tar.gz
sudo  mkdir /opt/apache-tomcat
sudo  mv ~/apache-tomcat-8.5.11 /opt/apache-tomcat
sudo chown -R tomcat:tomcat /opt/apache-tomcat
cat << EOT >> /etc/profile
JRE_HOME=/usr/java/default
CATALINA_HOME=/opt/apache-tomcat/apache-tomcat-8.5.11
export JRE_HOME CATALINA_HOME
EOT
sudo -u tomcat /opt/apache-tomcat/apache-tomcat-8.5.11/bin/startup.sh


