FROM debian:bookworm

RUN apt update && \
    apt upgrade -y && \
    apt install -y mariadb-server

COPY tools/script.sh /script.sh

RUN mkdir -p /run/mysqld && \
    chmod +x /script.sh

CMD ["/script.sh"]
