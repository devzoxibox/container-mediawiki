#!/bin/bash

# fichiers config
ln -s /usr/share/mediawiki /config 

# Démarrage
exec "$@"

