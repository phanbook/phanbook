#!/usr/bin/env bash
MYSQL="$(which mysql)"
if [ -f "$MYSQL" ]
then
    exit;
else
    echo ">>> Installing MySQL Server"
fi
# echo ">>> Installing MySQL Server"
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
sudo add-apt-repository 'deb http://mariadb.biz.net.id//repo/5.5/ubuntu trusty main'

echo $MYSQL_PASSWORD
echo $DB_NAME

# Install MySQLServer
# -qq implies -y --force-yes
sudo apt-get -y update
export DEBIAN_FRONTEND=noninteractive
sudo DEBIAN_FRONTEND=noninteractive apt-get -y  install mariadb-server
service mysql start
update-rc.d mysql defaults
# Setup password and create database
mysqladmin -u root password $MYSQL_PASSWORD
mysqladmin -u root -p$MYSQL_PASSWORD create $DB_NAME

# Import database

if [ "$ENV" == "production" ]; then
   mysql -u root -p$MYSQL_PASSWORD  $DB_NAME <  "${ROOT_DIR}databases/phanbook_prd.sql"
fi

if [ "$ENV" == "development" ]; then
   mysql -u root -p$MYSQL_PASSWORD  $DB_NAME <  "${ROOT_DIR}databases/phanbook.sql"
fi

