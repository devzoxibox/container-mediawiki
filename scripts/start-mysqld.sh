#!/bin/bash

if [ ! -f "/database/ibdata1" ]; then

	# copy over customised config
	cp -R /var/lib/mysql/* /database
				
fi



exec mysqld_safe --datadir=/database
