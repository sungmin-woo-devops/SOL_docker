FROM centos:stream9

RUN yum -y update && \
    yum -y install httpd mod_wsgi && \
    yum clean all

COPY vhost.conf /etc/httpd/conf.d/vhost.conf
COPY myapp.wsgi index.html /var/www/html/

RUN chown -R apache:apache /var/www/html && \
    chmod -R 755 /var/www/html

VOLUME /var/www/html /var/log/httpd
EXPOSE 80

ENTRYPOINT [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]