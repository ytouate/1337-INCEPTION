#!/bin/bash

rc-service nginx start
rc-service mariadb start
rc-service php-fpm81 start

cat DB.txt | mariadb -u root

exec $@