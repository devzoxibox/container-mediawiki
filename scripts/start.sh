#!/bin/bash

if [ ! -f "/config/index.php" ]; then

	# copy over customised config
	cp -R /usr/share/mediawiki/* /config
				
fi


# Démarrage
exec supervisord -n
#exec mysqld_safe
#exec /usr/sbin/apache2 -D FOREGROUND

