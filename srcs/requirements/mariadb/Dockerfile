FROM alpine:3.18.5

RUN apk update && apk upgrade && apk add mariadb-client mariadb \
	&& apk add openrc \
	&& mariadb-install-db --datadir=/var/lib/mysql --user=root --skip-test-db \
	&& mkdir -p /run/mysqld 

COPY maria.sh /maria.sh

RUN chmod +x /maria.sh

COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306

CMD [ "sh", "/maria.sh" ]
