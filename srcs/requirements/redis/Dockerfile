# Step 1 - Install redis-server package and php5-redis

# redis-server contem o redis, e o php7.3-redis é uma extensão para aplicações que funcionam em php comunicar com o redis.

# Step 2 - Configurar redis como uma cache

# Redis pode funcionar como uma base de dados NoSQL ou como uma cache, no nosso caso queremos configurar como uma cache.
# Vamos editar o ficheiro /etc/redis/redis.conf e adicionar estas linhas ao final

# maxmemory 256mb
# maxmemory-policy allkeys-lru


FROM debian:10.11


RUN apt-get update -y
RUN apt-get install redis-server php7.3-redis -y


COPY conf/start.sh /usr/local/bin/

ENTRYPOINT [ "start.sh" ]

