#!/bin/bash

# fichiers config
cp -R /usr/share/mediawiki/* /config 

# Démarrage
/bin/bash -c "/etc/apache2/envvars && /usr/sbin/apache2"

