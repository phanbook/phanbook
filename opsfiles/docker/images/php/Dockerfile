FROM ubuntu:14.04
MAINTAINER Phanbook <helllo@phanbook.com>


# run update and install nginx, php-fpm and other useful libraries
RUN apt-get update -y && \
    apt-get install -y \
    curl \
    wget \
    nano \
    git \
    php5-fpm \
    php5-cli \
    php5-intl \
    php5-mcrypt \
    php5-apcu \
    php5-gd \
    php5-curl \
    php5-mysql

# php-fpm config
RUN sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini
RUN sed -i -e "s/upload_max_filesize\s*=\s*2M/upload_max_filesize = 100M/g" /etc/php5/fpm/php.ini
RUN sed -i -e "s/post_max_size\s*=\s*8M/post_max_size = 100M/g" /etc/php5/fpm/php.ini
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
RUN sed -i -e "s/;catch_workers_output\s*=\s*yes/catch_workers_output = yes/g" /etc/php5/fpm/pool.d/www.conf

# PHP Error Reporting Config
RUN sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/fpm/php.ini
RUN sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/fpm/php.ini
RUN find /etc/php5/cli/conf.d/ -name "*.ini" -exec sed -i -re 's/^(\s*)#(.*)/\1;\2/g' {} \;

RUN apt-get -qq install php5-dev libpcre3-dev gcc make php5-mysql re2c
RUN (cd /tmp && git clone --depth=1 git://github.com/phalcon/cphalcon.git && \
    cd cphalcon/ext && \
    phpize &&  \
    ./configure && \
    make && make install)

RUN echo "extension=phalcon.so" > /etc/php5/fpm/conf.d/30-phalcon.ini
RUN echo "extension=phalcon.so" > /etc/php5/cli/conf.d/30-phalcon.ini

VOLUME [ "/var/www/html" ]
WORKDIR /var/www/html
EXPOSE 9000
CMD ["/usr/sbin/php5-fpm"]
