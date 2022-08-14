FROM debian:buster

RUN apt-get -y update
RUN apt-get -y install mariadb-server

COPY conf/start.sh /tmp/
RUN chmod +x /tmp/start.sh

RUN bash /tmp/start.sh
