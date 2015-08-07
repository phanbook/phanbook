FROM ubuntu:14.04
MAINTAINER Phanbook <helllo@phanbook.com>

ENV DEBIAN_FRONTEND noninteractive
ENV MYSQL_USER=admin \
    MYSQL_PASS=**Random** \
    MYSQL_DB=**False**
# Add MySQL configuration
ADD my.cnf /etc/mysql/conf.d/my.cnf

RUN apt-get -y update && \
    apt-get -y install mysql-server pwgen && \
    touch /var/lib/mysql/.EMPTY_DB

# Add MySQL scripts
ADD phanbook.sql /tmp/phanbook.sql
ADD run.sh /tmp/run.sh
RUN chmod 775 /tmp/run.sh


# Add VOLUMEs to allow backup of config and databases
VOLUME  ["/opt/data/mysql", "/var/lib/mysql"]

EXPOSE 3306
CMD ["/bin/bash", "/tmp/run.sh"]
