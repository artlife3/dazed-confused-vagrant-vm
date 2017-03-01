# apcu
echo "---------- apcu ----------"
PATH_WWW=$1
ADMIN=$2
echo "Args PATH_WWW:$PATH_WWW"
echo "Args ADMIN:$ADMIN"
echo "================================================================================"
PATH_ADMIN=$PATH_WWW/$ADMIN

cd $PATH_ADMIN
if [ ! -e $PATH_ADMIN/apcu ]; then
  git clone https://github.com/krakjoe/apcu.git
else
  echo "It already exists."
fi
