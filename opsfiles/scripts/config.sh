#!/usr/bin/env bash
#This is config for vagrant
#@todo refactor later
#
echo "export MYSQL_PASSWORD=password__phanbook" >>/etc/profile

echo "export DB_NAME=phanbook" >> /etc/profile
echo "export MYSQL_USER=phanbook" >> /etc/profile

echo "export ROOT_DIR=/usr/share/nginx/html/phanbook/" >> /etc/profile
echo "export ENV=development" >> /etc/profile

source /etc/profile
