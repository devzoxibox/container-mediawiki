#!/bin/bash

if [ ! -f "/config/*" ]; then

	# copy over customised config
	cp -R /usr/share/mediawiki/* /config
				
fi


# Démarrage
service mysql start
exec /usr/sbin/apache2 -D FOREGROUND

