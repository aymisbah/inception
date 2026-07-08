#!/bin/bash

grep -q "^init_file" /etc/mysql/mariadb.conf.d/50-server.cnf || \
echo "init_file = /etc/mysql/init.sql" >> /etc/mysql/mariadb.conf.d/50-server.cnf

exec mysqld -u root --bind-address=0.0.0.0