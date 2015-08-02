
# Install PHP
# -qq implies -y --force-yes
sudo yum -y install php \
    php-common\
    php-fpm\
    php-devel \
    php-gd \
    php-intl \
    php-mbstring \
    php-mcrypt \
    php-mysqlnd \
    php-opcache \
    php-pdo \
    php-pecl-apcu \
    php-pecl-xdebug \
    php-pear \
    php-xml
# Set PHP FPM to listen on TCP instead of Socket
#sudo sed -i "s/listen =.*/listen = /var/run/php5-fpm.sock/" /etc/php5/fpm/pool.d/www.conf
sudo sed -i "s|listen = 127.0.0.1:9000|listen = /var/run/php-fpm.sock|g" /etc/php-fpm.d/www.conf
# Set PHP FPM allowed clients IP address
#sudo sed -i "s/;listen.allowed_clients/listen.allowed_clients/" /etc/php5/fpm/pool.d/www.conf
# # xdebug Config
# 	cat > $(find /etc/php5 -name xdebug.ini) << EOF
# zend_extension=$(find /usr/lib/php5 -name xdebug.so)
# xdebug.remote_enable = 1
# xdebug.remote_connect_back = 1
# xdebug.remote_port = 9000
# xdebug.scream=0
# xdebug.cli_color=1
# xdebug.show_local_vars=1

# ; var_dump display
# xdebug.var_display_max_depth = 5
# xdebug.var_display_max_children = 256
# xdebug.var_display_max_data = 1024
# EOF

# PHP Error Reporting Config
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php.ini

sudo systemctl enable php-fpm.service
