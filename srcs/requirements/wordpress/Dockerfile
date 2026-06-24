
FROM debian:latest

RUN apt update && apt upgrade && apt install -y \
	php8.4-fpm \
	php8.4-mysql \
	mariadb-client \
	curl

COPY www.conf /etc/php/8.4/fpm/pool.d/.
COPY script.sh .
RUN chmod +x script.sh
CMD ["./script.sh"]

