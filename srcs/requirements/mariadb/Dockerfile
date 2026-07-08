FROM debian:bookworm

RUN apt update && \
    apt upgrade -y && \
    apt install -y mariadb-server

COPY script.sh /script.sh
COPY init.sql /etc/mysql/init.sql

RUN mkdir -p /run/mysqld && \
    chmod +x /script.sh

CMD ["/script.sh"]