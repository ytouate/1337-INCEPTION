#!/bin/bash

rc-service nginx start
rc-service mariadb start
rc-service php-fpm81 start

mariadb -e "CREATE DATABASE $WORDPRESS_DB_NAME;"
mariadb -e "CREATE USER '$WORDPRESS_DB_USER'@'$WORDPRESS_DB_HOST' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON wordpress_db.* TO '$WORDPRESS_DB_USER'@'$WORDPRESS_DB_HOST';"
mariadb -e "FLUSH PRIVILEGES;"
cd /var/www/localhost/htdocs/wordpress/ && rm -rf wp-config.php && \
wp config create --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbname=$WORDPRESS_DB_NAME && \
wp core install --url=ytouate --title=my_site --admin_user=ytouate --admin_password=$WORDPRESS_DB_PASSWORD \
--admin_email=touateyoussef2003@gmail.com --skip-email && \
cd -

exec $@