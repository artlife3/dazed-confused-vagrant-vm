# Tomcat
echo "---------- Tomcat8 ----------"
PATH_OPT=$1
CATALINA_OPTS=$2
DOMAINNAME=$3
echo "Args PATH_OPT:$PATH_OPT"
echo "Args CATALINA_OPTS:$CATALINA_OPTS"
echo "Args DOMAINNAME:$DOMAINNAME"
echo "================================================================================"

PATH_TOMCAT=$PATH_OPT/tomcat

sudo useradd -s /bin/bash tomcat
sudo mkdir $PATH_TOMCAT
cd $PATH_TOMCAT

wget -q http://ftp.kddilabs.jp/infosystems/apache/tomcat/tomcat-8/v8.5.11/bin/apache-tomcat-8.5.11.tar.gz
tar xvzf apache-tomcat-8.5.11.tar.gz
rm apache-tomcat-8.5.11.tar.gz

sudo ln -s $PATH_TOMCAT/apache-tomcat-8.5.11 $PATH_TOMCAT/tomcat8


# Replace tomcat-users.xml
cat << EOT > $PATH_TOMCAT/apache-tomcat-8.5.11/conf/tomcat-users.xml
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


# Added manager.xml
mkdir -p $PATH_TOMCAT/tomcat8/conf/Catalina/localhost
cat << EOT > $PATH_TOMCAT/tomcat8/conf/Catalina/localhost/manager.xml
<Context privileged="true" antiResourceLocking="false" docBase="\${catalina.home}/webapps/manager">
<Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="^.*$" /></Context>
EOT

sed -i "114s/^/\nCATALINA_OPTS=\"$CATALINA_OPTS -Xloggc:\/opt\/tomcat\/tomcat8\/logs\/tomcat-gc.log -XX:+PrintGCDetails\"\n/" $PATH_TOMCAT/tomcat8/bin/catalina.sh

sudo chown -R vagrant:vagrant $PATH_TOMCAT
sudo chmod -R g+rw $PATH_TOMCAT
sudo find $PATH_TOMCAT -type d -exec chmod g+x {} \;


# Added start up script
# @url https://gist.github.com/MasahiroSaito/fafc0fdb9de49d5661c45e9ba4e59d0f
# 
cat << EOT > /etc/init.d/tomcat8
#!/bin/bash

# Tomcat8: Start/Stop Tomcat 8
#
# chkconfig: - 90 10
# description: Tomcat is a Java application Server.

. /etc/init.d/functions
. /etc/sysconfig/network

CATALINA_HOME=$PATH_TOMCAT/tomcat8
TOMCAT_USER=vagrant

LOCKFILE=/var/lock/subsys/tomcat8

RETVAL=0
start(){
    echo "Starting Tomcat8: "
    su - \$TOMCAT_USER -c "\$CATALINA_HOME/bin/startup.sh"
    RETVAL=\$?
    echo
    [ \$RETVAL -eq 0 ] && touch \$LOCKFILE
    return \$RETVAL
}

stop(){
    echo "Shutting down Tomcat8: "
    \$CATALINA_HOME/bin/shutdown.sh
    RETVAL=\$?
    echo
    [ \$RETVAL -eq 0 ] && rm -f \$LOCKFILE
    return \$RETVAL
}

case "\$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        stop
        start
        ;;
    *)
        echo $"Usage: \$0 {start|stop|restart}"
        exit 1
        ;;
esac
exit \$?
EOT

sudo chmod +x /etc/init.d/tomcat8
sudo chkconfig --add tomcat8
sudo chkconfig tomcat8 on

sudo /etc/init.d/tomcat8 start


cat << EOT > /etc/httpd/conf.d/tomcat.conf
<VirtualHost *:80>
  ServerName tomcat.$DOMAINNAME

  <Directory />
    Options FollowSymLinks
    AllowOverride None
    ProxyPass  ajp://localhost:8009/
    ProxyPassReverse ajp://localhost:8009/
  </Directory>

</VirtualHost>
EOT

sudo /etc/init.d/httpd restart

