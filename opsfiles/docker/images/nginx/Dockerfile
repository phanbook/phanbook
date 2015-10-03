FROM ubuntu:14.04
MAINTAINER Phanbook <helllo@phanbook.com>


RUN apt-get update && apt-get install -y python-software-properties
RUN apt-get update && apt-get install -y nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME [ "/var/www/html" ]
WORKDIR /var/www/html

# RUN mkdir -p /etc/service/nginx
# ADD start.sh /etc/service/nginx/run
# RUN chmod +x /etc/service/nginx/run

EXPOSE 80

#ENTRYPOINT [ "/usr/sbin/nginx" ]
#CMD ["-D", "FOREGROUND"]
CMD ["nginx", "-g", "daemon off;"]
