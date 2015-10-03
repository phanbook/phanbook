#!/bin/sh

echo ">>> Installing Nginx"

# Install Nginx
# -qq implies -y --force-yes
apt-get -qq install nginx

# Turn off sendfile to be more compatible with Windows, which can't use NFS
sed -i 's/sendfile on;/sendfile off;/' /etc/nginx/nginx.conf
sed -i "s/# server_names_hash_bucket_size.*/server_names_hash_bucket_size 64;/" /etc/nginx/nginx.conf

cp -rf "$ROOT_DIR"opsfiles/templates/nginx/vhost /etc/nginx/vhost
cp "$ROOT_DIR"opsfiles/templates/nginx/nginx.conf.ubuntu /etc/nginx/nginx.conf

sudo service nginx restart

sudo update-rc.d nginx defaults

