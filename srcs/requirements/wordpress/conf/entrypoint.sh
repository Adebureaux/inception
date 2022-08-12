#!/bin/bash

sleep 100

mv /tmp/wordpress/* /var/www/wordpress/
chown -R www-data:www-data /var/www/*
service mysql start
service php7.3-fpm start
