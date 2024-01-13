FROM alpine:3.18.5

RUN apk update && apk upgrade \
	&& apk add wget && apk add lighttpd php fcgi php-cgi php-iconv \
	&& apk add wget mysql mysql-client php-mysqli mariadb-client php-fpm \
	php-phar \
	&& wget https://fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz -P /var/www \
	&& cd /var/www && tar -xzf wordpress-6.4.2-fr_FR.tar.gz && rm wordpress-6.4.2-fr_FR.tar.gz \
	&& chown -R root:root /var/www/wordpress

COPY conf/www.conf etc/php81/php-fpm.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN cd /var/www/wordpress

COPY conf/auto-config.sh auto-config.sh

RUN chmod +x auto-config.sh

ENTRYPOINT /auto-config.sh
