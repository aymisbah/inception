FROM debian:bookworm

RUN apt update && apt upgrade -y && \
    apt install -y nginx openssl && \
    mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/aymisbah.key \
        -out /etc/nginx/ssl/aymisbah.crt \
        -subj "/C=MA/ST=Khouribga/L=Khouribga/O=42/OU=Inception/CN=aymisbah.42.fr"

COPY conf/nginx.conf  /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
