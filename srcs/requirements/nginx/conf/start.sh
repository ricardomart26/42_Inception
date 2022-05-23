#! /bin/bash

sed -i "s/_USERNAME_/${USERNAME}/g" /etc/nginx/nginx.conf

nginx -g 'daemon off;'