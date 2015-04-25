#!/bin/bash

# fichiers config
cp -R /usr/share/mediawiki/* /config 

# Démarrage
exec /usr/sbin/apache2ctl start

