FROM    debian:bullseye

RUN     apt-get update
RUN     apt-get install nginx openssl libssl-dev wget -yq

COPY    conf/nginx.conf /etc/nginx/
COPY    conf/ssl_generator.sh .

COPY    ./tools/start.sh /

RUN     sh ssl_generator.sh

ENTRYPOINT ["bash", "start.sh"]
