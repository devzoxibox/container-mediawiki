#!/bin/bash

cp -R /var/lib/mysql/* /database

exec mysqld_safe --datadir=/database
