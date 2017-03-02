# phpMemcachedAdmin
echo "---------- phpMemcachedAdmin ----------"
PATH_WWW=$1
DIR_HTML=$2
ADMIN=$3
echo "Args PATH_WWW:$PATH_WWW"
echo "Args DIR_HTML:$DIR_HTML"
echo "Args ADMIN:$ADMIN"
echo "================================================================================"
PATH_ADMIN=$PATH_WWW/$DIR_HTML/$ADMIN

cd $PATH_ADMIN

if [ ! -e $PATH_ADMIN/phpmemcacheadmin ]; then
  git clone https://github.com/elijaa/phpmemcacheadmin.git
  cd phpmemcacheadmin
  sudo chmod +rx *
  sudo chmod 0777 Config/Memcache.php
  sudo chmod 0777 Temp/
else
  echo "It already exists."
fi
