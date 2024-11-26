#!/bin/bash

set -e

mkdir -p /run/php-fpm

if [ ! -d "/etc/php-fpm.d" ]; then
    echo "PHP-FPM configuration directory not found"
    exit
fi

# php-fpm 시작
/usr/sbin/php-fpm

# httpd 설정 확인
/usr/sbin/httpd -t

# httpd 시작 (포그라운드 모드)
/usr/sbin/httpd -D FOREGROUND