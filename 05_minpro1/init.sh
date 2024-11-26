#!/bin/bash

netstat -an | grep :21
nmap -p 21 localhost

docker network create ftpnet
docker volume create ftpvol

docker pull quay.io/centos/centos:stream9
docker tag quay.io/centos/centos:stream9 centos:stream9

mkdir -p ~/docker/05_minpro1 && cd ~/docker/05_minpro1
cat << EOF >> Dockerfile
FROM centos:stream9

RUN yum -y update && yum -y install vsftpd && yum -y clean all

COPY vsftpd.conf.template /etc/vsftpd/vsftpd.conf

VOLUME /var/ftp/pub
COPY WelcomeToMyFTPServer.txt /var/ftp/pub/WelcomeToMyFTPServer.txt 

EXPOSE 21 20 

ENTRYPOINT /usr/sbin/vsftpd

EOF

docker build --no-cache -t ftpimage .
docker images

docker run -d --name myftp \
-p 21:21 \
-v ftpvol:/var/ftp/pub \
--net ftpnet \
ftpimage