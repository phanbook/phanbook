FROM ubuntu:14.04
MAINTAINER YOUR NAME <YOUR EMAIL>


# run update  and other useful libraries
RUN apt-get update -y && \
    apt-get install -y \
    curl \
    wget \
    nano \
    git \
    php5-cli \
    php5-curl
#Install composer
RUN bash -c "wget http://getcomposer.org/composer.phar && mv composer.phar /usr/local/bin/composer"
RUN chmod +x /usr/local/bin/composer

ADD run.sh /tmp/run.sh
RUN chmod 775 /tmp/run.sh

VOLUME [ "/var/www/html" ]
WORKDIR /var/www/html

CMD ["/bin/bash", "/tmp/run.sh"]
