

FROM debian:10.11

RUN apt-get update
RUN apt-get install nginx openssl libssl-dev wget -yq

COPY tools/nginx.conf /etc/nginx/
COPY tools/ssl_generator.sh .
COPY conf/start.sh /usr/local/bin/

RUN sh ssl_generator.sh


# Ambos os ficheiros que criamos vao estar na dir /etc/ssl/

# Number of cpu cores
# RUN grep process/proc/cpuinfo | wc -l

# Max number of open files
# ulimit -n

ENTRYPOINT ["start.sh"]
