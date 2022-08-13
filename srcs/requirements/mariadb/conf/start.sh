#!/bin/bash

service mysql start

echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'admin' identified by 'admin';" | mysql -u root
echo "GRANT USAGE ON wordpress.* TO 'admin'@'localhost/wordpress' identified by 'admin';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost/wordpress' identified by 'admin';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
