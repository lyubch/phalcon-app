#!/usr/bin/env bash

#== Import script args ==

timezone=$1
domain=$2

#== Bash helpers ==

function info {
  echo " "
  echo "--> $1"
  echo " "
}

#== Provision script ==

info "Provision-script user: `whoami`"

export DEBIAN_FRONTEND=noninteractive

info "Configure timezone"
timedatectl set-timezone ${timezone} --no-ask-password

info "Prepare root password for MySQL"
debconf-set-selections <<< "mysql-community-server mysql-community-server/root-pass password \"''\""
debconf-set-selections <<< "mysql-community-server mysql-community-server/re-root-pass password \"''\""
echo "Done!"

info "Add external repositories"
apt-get install -y python-software-properties
add-apt-repository -y ppa:ondrej/php

info "Update OS software"
apt-get update
apt-get upgrade -y

info "Install additional software"
apt-get install -y apache2
apt-get install -y mysql-server-5.7
apt-get install -y php7.1 php7.1-cli php7.1-common php7.1-mysql php7.1-curl php7.1-gd libpcre3-dev php7.1-json php7.1-mbstring php7.1-dom php7.1-zip unzip php-phalcon
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

info "Configure APACHE2"
a2enmod rewrite
sed -i 's/export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=vagrant/g' /etc/apache2/envvars
sed -i 's/export APACHE_RUN_GROUP=www-data/export APACHE_RUN_GROUP=vagrant/g' /etc/apache2/envvars
echo "Done!"

info "Enabling site configuration"
ln -s /app/vagrant/apache2/app.conf /etc/apache2/sites-enabled/app.conf
sed -i "s/<domain>/$domain/g" /etc/apache2/sites-enabled/app.conf
echo "Done!"

info "Configure MySQL"
sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
mysql -uroot <<< "CREATE USER 'root'@'%' IDENTIFIED BY ''"
mysql -uroot <<< "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'"
mysql -uroot <<< "DROP USER 'root'@'localhost'"
mysql -uroot <<< "FLUSH PRIVILEGES"
echo "Done!"

info "Initailize databases for MySQL"
mysql -uroot <<< "CREATE DATABASE phalcon"
echo "Done!"