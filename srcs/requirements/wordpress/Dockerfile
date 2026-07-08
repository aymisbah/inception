FROM debian:bookworm

RUN apt update && \
    apt install -y \
        php8.2-fpm \
        php8.2-mysql \
        mariadb-client \
        curl && \
    curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp && \
    sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /etc/php/8.2/fpm/pool.d/www.conf && \
    mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www

COPY script.sh /script.sh

RUN chmod +x /script.sh

CMD ["/script.sh"]