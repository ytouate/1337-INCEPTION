#!/bin/bash

rc-service nginx start
rc-service mariadb start 
exec $@