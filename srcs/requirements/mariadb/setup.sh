#!/bin/bash

/etc/init.d/mariadb start

mariadb -e "CREATE DATABASE $WORDPRESS_DB_NAME;"
mariadb -e "CREATE USER '$WORDPRESS_DB_USER'@'$WORDPRESS_DB_HOST' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON wordpress_db.* TO '$WORDPRESS_DB_USER'@'$WORDPRESS_DB_HOST';"
mariadb -e "FLUSH PRIVILEGES;"

/etc/init.d/mariadb stop

exec $@