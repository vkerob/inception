FROM alpine:3.18.5

RUN apk update \
	upgrade \
	&& apk add nginx \
	openssl \
	fcgi \
	&& mkdir -p /etc/nginx/ssl

RUN mkdir -p /var/run/nginx \
	&& mkdir -p /var/www

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Angouleme/O=42/OU=42/CN=vkerob.42.fr/UID=vkerob"

COPY conf/nginx.conf /etc/nginx/http.d/default.conf

CMD [ "nginx", "-g", "daemon off;" ]

