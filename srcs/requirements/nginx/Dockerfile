FROM alpine:3.15

RUN apk update
RUN apk add --no-cache nginx openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout /etc/nginx/ssl/key.pem -out /etc/nginx/ssl/local.pem -days 365 -subj "/C=FR/ST=FRANCE/L=PARIS/O=42/OU=42PARIS/CN=adeburea"

RUN chown -R nginx:nginx /var/www;

RUN mkdir -p /run/nginx

COPY conf/default.conf /etc/nginx/http.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
