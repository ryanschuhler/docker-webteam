FROM mariadb:latest

COPY ./resources/ /

USER mysql

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["mysqld", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci"]
