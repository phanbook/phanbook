#!/usr/bin/env bash



sudo apt-get -qq install php5-dev libpcre3-dev gcc make php5-mysql re2c
cd /tmp
git clone --depth=1 git://github.com/phalcon/cphalcon.git
cd cphalcon/ext
sudo phpize && sudo ./configure
sudo make && sudo make install

echo "extension=phalcon.so" > /etc/php5/fpm/conf.d/30-phalcon.ini
echo "extension=phalcon.so" > /etc/php5/cli/conf.d/30-phalcon.ini

sudo service php5-fpm restart
