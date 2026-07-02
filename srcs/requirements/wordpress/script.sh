#!/bin/bash

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root

./wp-cli.phar config create \
    --dbname="$DB_NAME" \
    --dbuser="$DB_USER" \
    --dbpass=$(cat /run/secrets/db_password) \
    --dbhost=mariadb \
    --allow-root

./wp-cli.phar core install \
    --url="https://$DOMAIN_NAME" \
    --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password=$(cat /run/secrets/wp_admin_password) \
    --admin_email="$WP_ADMIN_EMAIL" \
    --allow-root

exec php-fpm8.4 -F