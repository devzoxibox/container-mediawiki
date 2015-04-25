#!/bin/bash

# fichiers config
cp -R /usr/share/mediawiki/* /config 

# Démarrage
service apache2 start

