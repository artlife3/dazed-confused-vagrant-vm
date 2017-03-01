# apcu
echo "---------- apcu ----------"
PATH_HOME=$1
PATH_WWW=$2
ADMIN=$3
echo "Args PATH_HOME:$PATH_HOME"
echo "Args PATH_WWW:$PATH_WWW"
echo "Args ADMIN:$ADMIN"
echo "================================================================================"


# Home
cd $PATH_HOME

if [ ! -L $PATH_HOME/html ]; then
ln -s $PATH_WWW .
fi

if [ ! -L $PATH_HOME/$ADMIN ]; then
ln -s $PATH_WWW/$ADMIN .
fi

if [ ! -L $PATH_HOME/log ]; then
ln -s /var/log .
fi
