su vagrant
umask 002

DRUPAL="drupal-8.2.6"
PATH="/var/www/html/"
DIR="drupal8"

#Drupal
mysql -u root -proot -e "CREATE DATABASE IF NOT EXISTS drupal8;"

if [ ! -e ${PATH}${DIR} ]; then

  cd ${PATH}
  wget -q https://ftp.drupal.org/files/projects/${DRUPAL}.tar.gz
  tar xvzf ${DRUPAL}.tar.gz
  rm ${DRUPAL}.tar.gz

  mv ${DRUPAL} ${DIR}

  cd ${PATH}${DIR}
  mkdir sites/default/files
  sudo chmod g+w sites/default/files
  cp sites/default/default.settings.php sites/default/settings.php
  sudo chown -R vagrant:vagrant ${PATH}${DIR}

else
  echo "CMS '${DIR}' already exists. Skip the process."
fi


