#!/bin/bash

# Ajout du mdp mysql
echo 'mysql-server mysql-server/root_password password $MYSQL_PASS' | debconf-set-selections
echo 'mysql-server mysql-server/root_password_again password $MYSQL_PASS' | debconf-set-selections

# Ajout du mdp et config phpmyadmin
echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password $MYSQL_PASS' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password $MYSQL_PASS' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/app-pass password $MYSQL_PASS' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections

# Installation de supervisor mediawiki
apt-get update && apt-get -q -y install supervisor mediawiki php-apc 

# Démarrage mysql pour installation auto phpmyadmin
service mysql start && apt-get -q -y install phpmyadmin


# Remove config apache2
rm /etc/apache2/conf.d/phpmyadmin.conf
rm /etc/apache2/conf.d/mediawiki.conf
rm -R /etc/apache2/sites-enabled/*
rm -R /etc/apache2/sites-available/*

# Droits pour apache2 et mysql
chown -R nobody:users /var/log/apache2/
chown -R nobody:users /var/lib/mysql
