#!/usr/bin/env bash
cp setup/php-fpm.conf /etc/nginx/conf.d/
cp setup/php.arepasapp.com.conf /etc/nginx/conf.d/
cp setup/php.ini /etc/
cp setup/www.conf /etc/php-fpm.d/
mkdir -p /etc/jscarton/ssl
cp ssl/* /etc/jscarton/ssl/
setenforce 0
service nginx restart
service php-fpm restart