# Wordpress
echo "---------- Wordpress ----------"
PATH_WWW=$1
echo "Args PATH_WWW:$PATH_WWW"
echo "================================================================================"

WORDPRESS="wordpress-4.7.2"
DIR="wordpress"

mysql -u root -proot -e "CREATE DATABASE IF NOT EXISTS wordpress;"

if [ ! -e $PATH_WWW/$DIR ]; then

  cd $PATH_WWW
  wget -q https://ja.wordpress.org/$WORDPRESS-ja.zip
  unzip -q $WORDPRESS-ja.zip
  rm $WORDPRESS-ja.zip

  sudo chown -R apache:vagrant $DIR
else
  echo "CMS '$DIR' already exists. Skip the process."
fi


