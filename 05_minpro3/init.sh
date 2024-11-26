#!/bin/bash

netstat -antp | grep :20
nmap -p 80 localhost

docker network create wsginet

# /var/www/html
docker volume create wsgivol

# /var/log/httpd
docker volume create wsgilogvol

cat << EOF >> Dockerfile
FROM centos:stream9

RUN yum -y update && \
    yum -y install httpd mod_wsgi && \
    yum clean all

COPY vhost.conf /etc/httpd/conf.d/vhost.conf
COPY myapp.wsgi /var/www/html/myapp.wsgi

VOLUME /var/www/wsgivol
EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EOF

docker build --no-cache -t wsgiimage .

docker run -d --name mywsgi \
-v wsgivol:/var/www/html \
-v wsgilogvol:/var/log/httpd \
--network wsginet \
-p 8000:80 \
wsgiimage