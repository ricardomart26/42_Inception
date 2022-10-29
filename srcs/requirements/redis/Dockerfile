# Step 1 - Install redis-server package and php5-redis

# redis-server contem o redis, e o php7.3-redis é uma extensão para aplicações que funcionam em php comunicar com o redis.

# Step 2 - Configurar redis como uma cache

# Redis pode funcionar como uma base de dados NoSQL ou como uma cache, no nosso caso queremos configurar como uma cache.
# Vamos editar o ficheiro /etc/redis/redis.conf e adicionar estas linhas ao final

# maxmemory 256mb
# maxmemory-policy allkeys-lru

# links to how to install https://hostadvice.com/how-to/how-to-install-wordpress-with-nginx-redis-2/ https://wp-rocket.me/blog/redis-object-caching/

# What is Redis?
# Redis (Remote Dictionary Server), is a in-memory key-value data store. Redis is now used has a database, cache, message broker and queue. Because of it's fast performance redis is a popular choice for caching, media streaming and session management.

# How redis works:
# Assume you have a web application running on a server, using a database like MySQL. When the web application needs to retrieve some records from MySQL, such queries take some time to return the requested records.
# Howeber, redis is made to make such processing faster and efficient. It's possible to store data processed by MySQL database query inside of a Redis cache instance. This allows data to be retrieved directly from the server's memory. This way the app will not go all the way back to the database. Instead the web server can check if it has the data it wants. So when another call is made and requires the same query transaction, the Redis Object will serve the request from the object cache.

# When you're running a large-scale fleet of hundredes of web server, one Redis cache can even pool the requests and answers for all those webservers. This eliminates the need for them to go all the way to the database each time.

# Why set up Redis with Wordpress:

# Wordpress does many MySQL query lookups, and it's very slow when you get lots of traffic.


# Benefits of redis:

# Performance
# All Redis data resides in memory, wich enables low latency and high data access. Unlike tradicional databases, in-memory data stores don't require a trip to disk, reducing engine latency to microseconds. Because of this, in-memory data stores can support more operations and faster response times.

# How to install redis:

# If you're running a very minimal distributions (such as Docker container) you may need to install lsb-release first
# sudo apt install lsb-release

# Add the repo to the apt index, update it and then install:

# curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
# sudo apt-get update
# sudo apt-get install redis

FROM debian:10.11

RUN apt-get update -y
RUN apt-get install redis-server -y
RUN apt-get update -y
RUN apt-get install unzip -y
RUN apt-get install php-dev -y

COPY conf/start.sh /usr/local/bin/


# This PHP script for WordPress was originally developed by Eric Mann. It is a Redis object cache backend for WordPress. Download the object-cache.php script. This download is from DigitalOcean’s asset server, but this is a third-party script. You should read the comments in the script to see how it works.

RUN apt-get install wget -y
RUN wget https://github.com/nicolasff/phpredis/archive/master.zip

RUN unzip master.zip

WORKDIR /phpredis-develop
# phpize command is used to prepare the build environmnet for a PHP extension. A successful install will create extname.so and put it into the PHP extensions directory. So we have to edit php.ini and add "extension=extname.so" line before you can use the extension
RUN phpize
RUN ./configure
RUN make && make install



# https://make.wordpress.org/cli/handbook/guides/installing/
# https://make.wordpress.org/cli/handbook/guides/quick-start/
# https://wp-cli.org/
# WP-CLI provides a command-line interface for many actions you might perform in the wordpress admin. 
# How to install WP-CLI?
# First download wp-cli.phar using curl
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# To be able to type just wp instead of php wp-cli.phar, you need to make the file executable and move it to the PATH
# chmod +x wp-cli.phar
# sudo mv wp-cli.phar /usr/local/bin/wp


# To install wp plugins, you can use the command wp plugin install [package name] --activate



ENTRYPOINT [ "start.sh" ]

