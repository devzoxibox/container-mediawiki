#!/bin/bash

# Ajout du mdp mysql
echo 'mysql-server mysql-server/root_password password password' | debconf-set-selections
echo 'mysql-server mysql-server/root_password_again password password' | debconf-set-selections

# Ajout du mdp et config phpmyadmin
echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password password' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password password' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/app-pass password password' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections

# Installation de phpmyadmin mediawiki
apt-get update && apt-get -q -y install mediawiki phpmyadmin

# modif dossier mediawiki
#cp -R /usr/share/mediawiki /config

# Remove config apache2
rm /etc/apache2/conf.d/phpmyadmin.conf
rm /etc/apache2/conf.d/mediawiki.conf
rm -R /etc/apache2/sites-enabled/*

