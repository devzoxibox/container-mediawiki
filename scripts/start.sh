#!/bin/bash

if [ ! -f "/config/*" ]; then

	# copy over customised config
	cp -R /usr/share/mediawiki/* /config
				
fi


# Démarrage
exec /usr/sbin/apache2 -D FOREGROUND

