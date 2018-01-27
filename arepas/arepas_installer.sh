#!/usr/bin/env bash

echo "---------------------------------------------------------------"
echo " "
echo " "
echo "      AREPAS4PHP INSTALLER v20170125"
echo " "
echo " "
echo "---------------------------------------------------------------"
yum -y install epel-release
yum -y update
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
echo "INSTALLING MYSQL 5.6"
echo "---------------------------------------------------------------"
rpm -Uvh http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum -y update
yum install -y mysql-server
systemctl start mysqld
systemctl enable mysqld

echo "---------------------------------------------------------------"
echo "INSTALLING PHPunit"
echo "---------------------------------------------------------------"
wget https://phar.phpunit.de/phpunit.phar
chmod +x ./phpunit.phar
mv /home/vagrant/phpunit.phar /usr/local/bin/phpunit
/usr/local/bin/phpunit --version

echo "---------------------------------------------------------------"
echo "INSTALLING LATEST COMPOSER"
echo "---------------------------------------------------------------"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv /home/vagrant/composer.phar /usr/local/bin/composer
/usr/local/bin/composer --version

echo "---------------------------------------------------------------"
echo "INSTALLING NODE 6.X"
echo "---------------------------------------------------------------"
curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
yum -y install nodejs
node -v

echo "---------------------------------------------------------------"
echo "CONFIGURING FIRST SITE"
echo "---------------------------------------------------------------"
cd /home/vagrant/arepas/recipes/nginx/php/
chmod +x install.sh
./install.sh
cd /home/vagrant/arepas/
rm -rf recipes
echo "---------------------------------------------------------------"
echo " AREPAS4PHP SETUP HAS BEEN COMPLETED"
echo "---------------------------------------------------------------"
