#!/usr/bin/env bash
MYSQL="$(which mariadb)"
if [ -f "$MYSQL" ]
then
    exit;
else
    echo ">>> Installing MySQL Server"
fi
echo $MYSQL_PASSWORD
echo $DB_NAME

# Install MySQL Server
# -qq implies -y --force-yes
sudo yum -y install mariadb-server mariadb
sudo systemctl enable mariadb.service
sudo systemctl start mariadb

# Setup password and create database
mysqladmin -u root password ${MYSQL_PASSWORD}
mysqladmin -u root -p${MYSQL_PASSWORD} create $DB_NAME

# Import database
#mysql -u root -p$MYSQL_PASSWORD  $DB_NAME <  /tmp/forum.sql

