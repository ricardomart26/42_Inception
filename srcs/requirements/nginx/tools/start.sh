#! /bin/bash

sed -i "s/_USERNAME_/rimartin/g" /etc/nginx/nginx.conf

nginx -g 'daemon off;'
