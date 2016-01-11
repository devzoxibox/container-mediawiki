#!/bin/bash

# Installation Apache2
apt-get update && apt-get -q -y install apache2 php5 php5-mysql libapache2-mod-php5 php-apc php5-intl imagemagick php5-cli

# Installation de MediaWiki
  ## Env
MEDIAWIKI_VERSION=1.26
MEDIAWIKI_FULL_VERSION=1.26.2

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


# Configuration php.ini
#sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 20M/g' /etc/php5/apache2/php.ini
#sed -i 's/memory_limit = 8M/memory_limit = 128M/g' /etc/php5/apache2/php.ini

