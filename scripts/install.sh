#!/bin/bash

# Ajout du mdp mysql
echo 'mysql-server mysql-server/root_password password $MARIADB_ROOT_PASSWD' | debconf-set-selections
echo 'mysql-server mysql-server/root_password_again password $MARIADB_ROOT_PASSWD' | debconf-set-selections

# Ajout du mdp et config phpmyadmin
echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password $MARIADB_ROOT_PASSWD' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password $MARIADB_ROOT_PASSWD' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/app-pass password $MARIADB_ROOT_PASSWD' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections


# Installation de supervisor mediawiki
apt-get update && apt-get -q -y install apache2 python-software-properties mariadb-server php5 php5-mysql libapache2-mod-php5 php-apc php5-intl imagemagick php5-cli

# Démarrage mysql pour installation auto phpmyadmin
service mysql start && apt-get -q -y install phpmyadmin

# Installation de MediaWiki
  ## Env
MEDIAWIKI_VERSION=1.24
MEDIAWIKI_FULL_VERSION=1.24.2

  ## Install
mkdir -p /download
mkdir -p /download/www
chown -R nobody:users /download
chown -R nobody:users /download/www
cd /download
wget https://releases.wikimedia.org/mediawiki/$MEDIAWIKI_VERSION/mediawiki-$MEDIAWIKI_FULL_VERSION.tar.gz
tar -xvzf /download/mediawiki-*.tar.gz
cp -R /download/mediawiki-$MEDIAWIKI_FULL_VERSION/* /download/www
rm -R /download/mediawiki-$MEDIAWIKI_FULL_VERSION
rm -R /download/mediawiki-$MEDIAWIKI_FULL_VERSION.tar.gz

# Configuration du apache2.conf
sed -i 's/#Include conf.d\//Include conf.d\//g' /etc/apache2/apache2.conf

# Configuration php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 20M/g' /etc/php5/apache2/php.ini
sed -i 's/memory_limit = 8M/memory_limit = 128M/g' /etc/php5/apache2/php.ini


# Remove config apache2
rm -R /etc/apache2/sites-enabled/*
rm -R /etc/apache2/sites-available/*

# Droits pour apache2
chown -R nobody:users /var/log/apache2/
