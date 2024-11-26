#!/bin/bash

docker network create phpnet
docker volume create phpvol
docker volume create logvol


cat << EOF >> Dockerfile
FROM centos:stream9

RUN yum -y update && \
    yum -y install httpd php && \
    yum clean all

COPY index.html info.php /var/www/html/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME /var/www/html /var/log/httpd
EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
EOF


docker build --no-cache -t phpimage .
docker images

docker run -d --name myphp \
-v phpvol:/var/www/html \
-v logvol:/var/log/httpd \
--network phpnet \
-p 80:80 \
phpimage