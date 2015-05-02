#!/bin/bash

# Démarrage de apache2
a2enconf mediawiki
exec /usr/sbin/apache2 -D FOREGROUND
