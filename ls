.:
ls
srcs

./srcs:
deleteEveything.txt
docker-compose.yml
requirements
secrets
web

./srcs/requirements:
mariadb
ngnix
wordpress

./srcs/requirements/mariadb:
50-server.cnf
Dockerfile
init.sql
script.sh

./srcs/requirements/ngnix:
default
Dockerfile
nginx.conf

./srcs/requirements/wordpress:
Dockerfile
script.sh
www.conf

./srcs/secrets:
admin_wp.txt
db_pass.txt

./srcs/web:
index.html
index.php
