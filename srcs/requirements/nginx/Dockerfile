FROM alpine:3.18.5

RUN apk update && apk upgrade && apk add nginx && mkdir -p /etc/nginx/ssl && apk add openssl

RUN mkdir -p /var/run/nginx

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Angouleme/O=42/OU=42/CN=vkerob.42.fr/UID=vkerob"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/lib/nginx/html

RUN chown -R nginx:nginx /var/lib/nginx/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]

