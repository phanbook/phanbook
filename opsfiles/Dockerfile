FROM ubuntu
MAINTAINER "Phanbook" <hello@phanbook.com>
ENV container docker

RUN apt-get update && apt-get install -yqq \
    curl \
    git \
    libxml2-dev \
    python \
    build-essential \
    make \
    gcc \
    python-dev \
    locales \
    python-pip \
    wget
#

ENV  DEBIAN_FRONTEND noninteractive
ENV  MYSQL_PASSWORD password__phanbook
ENV  DB_NAME phanbook
ENV  ENV production
ENV  ROOT_DIR /usr/share/nginx/html/www/
# Copy site into place.
COPY . ${ROOT_DIR}

#Adding shell scripts
ADD opsfiles/scripts/ubuntu/mysql.sh /tmp/mysql.sh
ADD opsfiles/scripts/ubuntu/nginx.sh /tmp/nginx.sh
ADD opsfiles/scripts/ubuntu/php.sh /tmp/php.sh
ADD opsfiles/scripts/ubuntu/phalcon.sh /tmp/phalcon.sh
ADD opsfiles/scripts/ubuntu/elastic.sh /tmp/elastic.sh
ADD opsfiles/scripts/app.sh /tmp/app.sh
ADD opsfiles/scripts/run.sh /tmp/run.sh

# Set permision exceute files
RUN chmod 755 /tmp/*.sh

#Install Nginx
RUN ./tmp/nginx.sh

#install php-fpm
RUN ./tmp/php.sh

#install mysql
RUN ./tmp/mysql.sh

#install phalcon
RUN ./tmp/phalcon.sh

#install elastic
RUN ./tmp/elastic.sh

RUN ./tmp/app.sh

# Install php composer and dependency
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable passwordless sudo for the "vagrant" user
#RUN echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/vagrant
#CMD /usr/sbin/sshd -D -o UseDNS=no -o UsePAM=no

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
CMD ["sh", "/tmp/run.sh"]

#CMD ["php5-fpm" ,"-D"]
#ENTRYPOINT /usr/sbin/php5-fpm -D
#CMD ["/bin/bash", "/tmp/run.sh"]
