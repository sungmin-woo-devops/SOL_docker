FROM centos:stream9

RUN yum -y update && yum -y install vsftpd && yum -y clean all

COPY vsftpd.conf.template /etc/vsftpd/vsftpd.conf

VOLUME /var/ftp/pub
COPY WelcomeToMyFTPServer.txt /var/ftp/pub/WelcomeToMyFTPServer.txt 

EXPOSE 21 20 

ENTRYPOINT ["/usr/sbin/vsftpd"]