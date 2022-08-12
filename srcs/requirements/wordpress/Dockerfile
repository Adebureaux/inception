FROM debian:buster

RUN apt-get -y update
RUN apt -y install wget
RUN apt -y install mariadb-client
RUN apt -y install php-fpm php-mysql

#SETUP MYSQL
RUN apt -y install mariadb-server
COPY conf/wordpress.sql /tmp/
COPY conf/mysql.sh /tmp/
RUN bash /tmp/mysql.sh

COPY conf/wp-config.php /var/www/wordpress/
RUN cd /tmp && wget https://wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz

COPY conf/entrypoint.sh .

ENTRYPOINT ["bash", "/entrypoint.sh"]
