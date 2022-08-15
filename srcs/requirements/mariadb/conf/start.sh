#!/bin/bash

mysqld&
until mysqladmin ping; do
	sleep 2
	echo "(fail to ping)"
done

echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'admin' identified by 'admin';" | mysql -u root
echo "GRANT USAGE ON wordpress.* TO 'admin'@'%' identified by 'admin';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%' identified by 'admin';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

killall mysqld
mysqld
