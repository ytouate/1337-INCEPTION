#!/bin/bash

/etc/init.d/mariadb restart

mariadb -u root -e "CREATE DATABASE wp_db;"
mariadb -u root -e "CREATE USER 'ytouate'@'%' IDENTIFIED BY 'pass';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON wp_db.* TO 'ytouate'@'%';"
mariadb -u root -e "FLUSH PRIVILEGES;"

sleep 2

/etc/init.d/mariadb stop

exec $@