#!/bin/sh

# Attendre que la base de données MariaDB soit prête
sleep 10

# Vérifier si le fichier wp-config.php existe
cd /var/www/wordpress
if [ ! -f wp-config.php ]; then
	wp config create --dbname=${DATABASE_NAME} \
		--dbuser=${DATABASE_USR} \
		--dbpass=${DATABASE_PASS} \
		--dbhost=mariadb

	wp core install --url="${DOMAIN_NAME}" \
		--title="inception" \
		--admin_user=${ADMIN_NAME} \
		--admin_password=${ADMIN_PASS} \
		--admin_email=${ADMIN_EMAIL} 

	wp user create ${USER_NAME} ${USER_EMAIL} --role=subscriber \
		--user_pass=${USER_PASS}
fi

exec php-fpm81 -F

