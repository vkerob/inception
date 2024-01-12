#!/bin/sh

wordpress_dir="/var/www/"

# Attendre que la base de données MariaDB soit prête
sleep 10

# Vérifier si le fichier wp-config.php existe
if [ ! -f "$wordpress_dir/wp-config.php" ]; then


	wp config create --allow-root \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--dbhost=mariadb:3306 --path='/var/www/'

fi
/usr/sbin/php-fpm81 -F

