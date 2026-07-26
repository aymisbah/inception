#!/bin/bash

set -e

mysql_install_db

DB_NAME="$DB_NAME"
DB_USER="$DB_USER"
DB_PASSWORD=$(cat /run/secrets/db_password)

cat > /etc/mysql/init.sql <<EOF
CREATE DATABASE IF NOT EXISTS ${DB_NAME};

CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';

GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';

FLUSH PRIVILEGES;
EOF

grep -q "^init_file" /etc/mysql/mariadb.conf.d/50-server.cnf || \
echo "init_file = /etc/mysql/init.sql" >> /etc/mysql/mariadb.conf.d/50-server.cnf

exec mysqld -u root --bind-address=0.0.0.0