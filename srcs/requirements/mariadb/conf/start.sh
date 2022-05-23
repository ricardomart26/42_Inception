#! /bin/bash

service mysql start;

if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ]; then
    mysql -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE ${MYSQL_DATABASE} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
    mysql -e "CREATE USER ${MYSQL_USER}@localhost IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost';"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}' WITH GRANT OPTION;"    
    mysql -e "FLUSH PRIVILEGES;"
    mysql -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} < wordpress.sql
    mysql -e "ALTER USER '${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
fi

mysqladmin -u ${MYSQL_ROOT_USER} -p${MYSQL_PASSWORD} shutdown;

mysqld;