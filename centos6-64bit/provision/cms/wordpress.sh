su vagrant
umask 002

WORDPRESS="wordpress-4.7.2"
PATH="/var/www/html/"
DIR="wordpress"

#Wordpress
mysql -u root -proot -e "CREATE DATABASE IF NOT EXISTS wordpress;"

if [ ! -e ${PATH}${DIR} ]; then

  cd ${PATH}$
  wget -q https://ja.wordpress.org/${WORDPRESS}-ja.zip
  unzip -q ${WORDPRESS}-ja.zip
  rm ${WORDPRESS}-ja.zip

  sudo chown -R apache:vagrant ${DIR}
else
  echo "CMS '${DIR}' already exists. Skip the process."
fi


