FROM mysql:latest

COPY config/ /etc/mysql/
COPY initdb/*.sql /docker-entrypoint-initdb.d/
