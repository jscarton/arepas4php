#!/usr/bin/env bash

echo "---------------------------------------------------------------"
echo " "
echo " "
echo "      AREPAS4PHP INSTALLER v20171015"
echo " "
echo " "
echo "---------------------------------------------------------------"
yum -y install epel-release
yum update
yum -y install nano wget


echo "---------------------------------------------------------------"
echo "INSTALLING GIT"
echo "---------------------------------------------------------------"
yum -y install git

echo "---------------------------------------------------------------"
echo "INSTALLING NGINX"
echo "---------------------------------------------------------------"
yum install -y nginx
systemctl start nginx
systemctl enable nginx

echo "---------------------------------------------------------------"
echo "INSTALLING PHP 7.1"
echo "---------------------------------------------------------------"
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum install -y php71w-cli php71w-common php71w-gd php71w-mbstring php71w-mcrypt php71w-mysqlnd php71w-xml php71w-fpm
systemctl start php-fpm
systemctl enable php-fpm

echo "---------------------------------------------------------------"
echo " AREPAS4PHP SETUP HAS BEEN COMPLETED"
echo "---------------------------------------------------------------"
