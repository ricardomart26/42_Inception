
echo "****************** ERROR/ACCESS LOGS ******************\n"

echo "NGINX ERROR/ACCESS LOG:" 
sudo docker exec -i nginx bash << EOF
    cat var/log/nginx/${USERNAME}-error.log
    cat var/log/nginx/${USERNAME}-access.log
EOF

echo "\nWORDPRESS ERROR/ACCESS LOG:" 
sudo docker exec -i wordpress bash << EOF
    cat var/log/php7.3-fpm.log
EOF

echo "\nMARIADB ERROR/ACCESS LOG:" 
sudo docker exec -i mariadb bash << EOF
    cat /var/log/mysql/error.log
EOF
