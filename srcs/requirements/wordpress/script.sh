#!/bin/bash

set -e

cd /var/www/html

[ -f wp-config.php ] || 
{
    wp core download --allow-root

    wp config create \
        --dbname="$DB_NAME" \
        --dbuser="$DB_USER" \
        --dbpass="$(cat /run/secrets/db_password)" \
        --dbhost=mariadb \
        --allow-root

    wp core install \
        --url="https://$DOMAIN_NAME" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$(cat /run/secrets/wp_admin_password)" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --allow-root

    wp user create \
        "$WP_USER" \
        "$WP_USER_EMAIL" \
        --user_pass="$(cat /run/secrets/wp_user_password)" \
        --role=author \
        --allow-root
}

exec php-fpm8.2 -F