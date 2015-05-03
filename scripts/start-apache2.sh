#!/bin/bash

# Démarrage de apache2
a2ensite mediawiki
a2ensite phpmyadmin
exec /usr/sbin/apache2 -D FOREGROUND
