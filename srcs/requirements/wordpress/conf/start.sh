#!/bin/bash

wp core download --allow-root
wp config create --dbname=$DB_NAME --dbuser=$LOGIN --dbpass=$PASSWORD --dbhost="mariadb" --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
wp core install --url=localhost/wordpress --title=$WEBSITE --admin_user=$LOGIN --admin_password=$PASSWORD --admin_email=$EMAIL --skip-email --allow-root
wp user create $LOGIN --role=author --user_pass=$PASSWORD --allow-root

wp redis enable --allow-root
php-fpm7.3 -F -R
