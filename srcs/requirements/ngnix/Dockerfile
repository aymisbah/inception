FROM debian:latest

RUN apt update && apt upgrade -y && \
    apt install -y nginx openssl && \
    mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/inception.key \
        -out /etc/nginx/ssl/inception.crt \
        -subj "/C=MA/ST=Casablanca/L=Khouribga/O=42/OU=Inception/CN=aymisbah.42.fr"

COPY default /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
