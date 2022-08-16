#!/bin/bash

# if $(find /var/lib/mysql/wordpress/ -type d -empty); then
chown -R mysql:mysql /var/lib/wordpress
mysqld&
until mysqladmin ping; do
	sleep 1
done
echo "create database wordpress;" | mysql -u root
echo "create user '$LOGIN' identified by '$PASSWORD';" | mysql -u root
echo "grant usage on wordpress.* TO '$LOGIN'@'%' identified by '$PASSWORD';" | mysql -u root
echo "grant all privileges on wordpress.* TO '$LOGIN'@'%' identified by '$PASSWORD';" | mysql -u root
echo "flush privileges;" | mysql -u root
killall mysqld
# fi
mysqld
