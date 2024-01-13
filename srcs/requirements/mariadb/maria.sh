#!/bin/sh

echo "CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};

CREATE USER IF NOT EXISTS '${DATABASE_USR}'@'%';

SET PASSWORD FOR '${DATABASE_USR}'@'%' = PASSWORD('${DATABASE_PASS}');

GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DATABASE_USR}'@'%';

FLUSH PRIVILEGES;" > /init.sql

exec /usr/bin/mariadbd --no-defaults --user=root --datadir=/var/lib/mysql --init-file=/init.sql