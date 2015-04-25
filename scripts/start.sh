#!/bin/bash

# fichiers config
ln -s /config /usr/share/mediawiki

# Démarrage
exec "$@"

