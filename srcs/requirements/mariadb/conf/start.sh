#!/bin/bash

service mysql start
echo "CREATE DATABASE $DB_NAME;" | mysql -u root
echo "CREATE USER 'admin' identified by '"$LOGIN"';" | mysql -u root
echo "GRANT USAGE ON $DB_NAME.* TO '"$EMAIL"' identified by '"$LOGIN"';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '"$EMAIL"' identified by '"$LOGIN"';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

sleep 100
