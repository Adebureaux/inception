FROM debian:buster

RUN apt-get -y update
RUN apt-get -y install nginx
RUN apt-get -y install openssl

RUN mkdir /var/www/wordpress
RUN chmod -R 755 /var/www/*

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout /etc/nginx/ssl/key.pem -out /etc/nginx/ssl/local.pem -days 365 -subj "/C=FR/ST=FRANCE/L=PARIS/O=42/OU=42PARIS/CN=adeburea"

COPY conf/nginx.conf /etc/nginx/sites-enabled/

CMD ["nginx", "-g", "daemon off;"]
