echo "****************** PORTS LOGS ******************\n"

# apt-get install iproute

echo "WORDPRESS PORTS:"
sudo docker exec -i wordpress bash << EOF
ss -tulpn
EOF

echo "\nNGINX PORTS:"
sudo docker exec -i nginx bash << EOF
ss -tulpn
EOF

echo "\nMARIADB PORTS:"
sudo docker exec -i mariadb bash << EOF
ss -tulpn
EOF