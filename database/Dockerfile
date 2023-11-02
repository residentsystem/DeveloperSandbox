# The main MySQL on RHEL image. May be used as-is to BUILD MySQL database server on RHEL.
FROM registry.redhat.io/rhel9/mysql-80
LABEL author="Eric Lacroix"

# APP_DATA=/opt/app-root/src

ENV MYSQL_USER='lacroixe' \
    MYSQL_PASSWORD='Password' \
    MYSQL_DATABASE='bookmark' \
    MYSQL_ROOT_PASSWORD='Password' \
    HOME=/var/lib/mysql \
    MYSQL_DEFAULTS_FILE=/etc/my.cnf \
    DATABASE_CONFIG_FILE=/home/dataconfig-dev.sh \
    DATABASE_CREATE_FILE=/home/datacreate-dev.sql

WORKDIR /home
COPY dataconfig-dev.sh .
COPY datacreate-dev.sql .

WORKDIR /etc
COPY config/my.cnf .

# Set owner and fix HOME permissions
USER 0
RUN chown -R 27:0 ${HOME} && \
    fix-permissions ${HOME} && \
    chown -R 27:0 ${MYSQL_DEFAULTS_FILE} && \
    fix-permissions ${MYSQL_DEFAULTS_FILE} && \
    chown -R 27:0 ${DATABASE_CONFIG_FILE} && \
    fix-permissions ${DATABASE_CONFIG_FILE} && \
    chown -R 27:0 ${DATABASE_CREATE_FILE} && \
    fix-permissions ${DATABASE_CREATE_FILE}
USER 27

# Expose server port
EXPOSE 5507

# Run the server
ENTRYPOINT ["container-entrypoint"]
CMD ["run-mysqld"]