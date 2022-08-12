FROM debian:buster

RUN apt-get -y update
RUN apt -y install wget
RUN apt -y install mariadb-client
RUN apt -y install php-fpm php-mysql

RUN wget https://wordpress.org/latest.tar.gz && tar --remove-files -xzvf latest.tar.gz
RUN chown -R www-data:www-data /wordpress*

COPY conf/entrypoint.sh .

ENTRYPOINT ["bash", "entrypoint.sh"]
