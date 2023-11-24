if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ]; then
    mysqld&
    until mysqladmin ping; do
        sleep 2
    done
    mysql -u root -e "CREATE DATABASE ${MYSQL_DATABASE};"
    mysql -u root -e "CREATE USER '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
    mysql -u root -e "GRANT ALL ON *.* TO '${MYSQL_ROOT_USER}'@'%';"
    mysql -u root -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -u root -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
    mysql -u root -e "DELETE FROM mysql.user WHERE user='root';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    killall mysqld
fi

mysqld
