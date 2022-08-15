FROM debian:buster

RUN apt-get -y update
RUN apt-get -y install mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /run/mysqld/
RUN chown -R mysql:root /run/mysqld

COPY conf/start.sh /tmp/

CMD ["bash", "/tmp/start.sh"]
