#!/bin/bash

rc-service nginx start
rc-service mariadb start
rc-service php-fpm81 start
/usr/bin/mysql_install_db --user=mysql
/etc/init.d/mariadb start && rc-update add mariadb default
/usr/bin/mysqladmin -u root password 'password'

exec $@