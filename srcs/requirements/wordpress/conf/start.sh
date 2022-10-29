#! /bin/bash

sed -i "s/;opcache.memory_comsumption = *./opcache.memory_comsumption = 256/g" /etc/php/7.3/fpm/php.ini
sed -i "s/upload_max_filesize = *./upload_max_filesize = 256/g" /etc/php/7.3/fpm/php.ini
sed -i "s/upload_max_filesize = *./upload_max_filesize = 256/g" /etc/php/7.3/fpm/php.ini

sed -i "s/_server_name_/www.42.rimartin.fr/g" /var/www/html/wordpress/wp-config.php

# Comeca simplesmente para criar o PID do php-fpm
service php7.3-fpm start
service php7.3-fpm stop

php-fpm7.3 -F -R
