#!/bin/bash

# déplacement config mediawiki
if [ ! -f "/config/index.php" ]; then

	# copy over customised config
	cp -R /usr/share/mediawiki/* /config
				
fi

# Démarrage
exec supervisord -n
