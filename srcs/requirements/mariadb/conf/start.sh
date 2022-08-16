#!/bin/bash

mysqld&
until mysqladmin ping; do
	sleep 1
done
echo "create database if not exists wordpress;" | mysql -u root
echo "create user if not exists '$LOGIN' identified by '$PASSWORD';" | mysql -u root
echo "grant usage on wordpress.* TO '$LOGIN'@'%' identified by '$PASSWORD';" | mysql -u root
echo "grant all privileges on wordpress.* TO '$LOGIN'@'%' identified by '$PASSWORD';" | mysql -u root
echo "flush privileges;" | mysql -u root
killall mysqld

mysqld
