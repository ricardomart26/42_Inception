# Solve problem https://forums.docker.com/t/files-havent-been-copied-to-volume-folder-during-docker-run/114478/2
FROM debian:10.11

RUN apt-get update -yq
RUN apt-get install wget -yq
RUN apt-get install php7.3 php-cgi php-common php-fpm php-pear php-mbstring php-zip php-net-socket \
	php-gd php-xml-util php-gettext php-mysql php-bcmath unzip git -yq

WORKDIR /var/www/html/

RUN wget https://wordpress.org/latest.tar.gz 
RUN tar -xvzf latest.tar.gz && rm latest.tar.gz
COPY tools/wp-config.php ./wordpress/
RUN chown -R www-data:www-data ./wordpress

EXPOSE 9000

WORKDIR /
COPY tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY conf/start.sh /usr/local/bin/
ENTRYPOINT ["start.sh"]
