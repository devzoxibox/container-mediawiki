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

# Installation de supervisor mediawiki
apt-get update && apt-get -q -y install apache2 mysql-server php5 php5-mysql libapache2-mod-php5 php-apc php5-intl imagemagick php5-cli

# Démarrage mysql pour installation auto phpmyadmin
service mysql start && apt-get -q -y install phpmyadmin

# Installation de MediaWiki
  # Env
MEDIAWIKI_VERSION=1.24
MEDIAWIKI_FULL_VERSION=1.24.2
MEDIAWIKI_DOWNLOAD_URL="https://releases.wikimedia.org/mediawiki/$MEDIAWIKI_VERSION/mediawiki-$MEDIAWIKI_FULL_VERSION.tar.gz";

mkdir -p /config  && cd /tmp
wget $MEDIAWIKI_DOWNLOAD_URL
tar -xvzf /tmp/mediawiki-*.tar.gz
mv mediawiki-*/* /config
rm mediawiki-*/*



# Remove config apache2
rm -R /etc/apache2/sites-enabled/*
rm -R /etc/apache2/sites-available/*

# Droits pour apache2 et mysql
chown -R nobody:users /var/log/apache2/
chown -R nobody:users /var/lib/mysql
