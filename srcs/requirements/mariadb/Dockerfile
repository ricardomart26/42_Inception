FROM	debian:buster

RUN     apt-get update -y && \
		apt-get install mariadb-server -y

RUN		mkdir -p /var/run/mysqld && mkdir -p /run/mysqld
RUN     chown -R mysql:root /run/mysqld && chown -R mysql:root /var/run/mysqld

COPY    tools/start.sh /
COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT  ["bash", "start.sh"]