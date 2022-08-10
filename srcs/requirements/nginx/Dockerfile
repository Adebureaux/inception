FROM debian:buster

RUN apt-get -y update
RUN apt-get -y install nginx
RUN apt-get -y install openssl

COPY conf/nginx.conf /etc/nginx/default.conf
RUN mkdir /var/www/wordpress
RUN chmod -R 755 /var/www/*
COPY conf/nginx.conf /etc/nginx/sites-available/wordpress
RUN ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout /etc/nginx/ssl/key.pem -out /etc/nginx/ssl/local.pem -days 365 -subj "/C=FR/ST=FRANCE/L=PARIS/O=42/OU=42PARIS/CN=adeburea"

COPY conf/debug.sh ./
RUN chmod +x debug.sh
CMD bash debug.sh

# CMD ["nginx", "-g", "daemon off;"]
