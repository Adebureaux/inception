#!/bin/bash

mysqld&
until mysqladmin ping; do
	sleep 2
	echo "(fail to ping)"
done

echo "create database wordpress;" | mysql -u root
echo "create user 'adeburea' identified by 'Jb5Td47G';" | mysql -u root
echo "grant usage on wordpress.* TO 'adeburea'@'%' identified by 'Jb5Td47G';" | mysql -u root
echo "grant all privileges on wordpress.* TO 'adeburea'@'%' identified by 'Jb5Td47G';" | mysql -u root
echo "flush privileges;" | mysql -u root

killall mysqld
mysqld
