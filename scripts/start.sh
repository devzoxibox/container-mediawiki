#!/bin/bash

# fichiers config
cp -R /usr/share/mediawiki/* /config 

# Démarrage
/bin/bash -c "/usr/sbin/apache2"

