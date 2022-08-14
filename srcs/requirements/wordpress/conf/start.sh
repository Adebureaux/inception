#!/bin/bash

wp core download --path=/var/www/wordpress --allow-root
php-fpm7 -F -R
