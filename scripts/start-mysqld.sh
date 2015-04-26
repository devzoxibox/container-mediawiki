#!/bin/bash

# Copie des DB dans le volumes /database
if [ ! -f "/database/ibdata1" ]; then

	# copy over customised config
	cp -R /var/lib/mysql/* /database
				
fi


# Démarrage de mysql
exec mysqld_safe --datadir=/database
