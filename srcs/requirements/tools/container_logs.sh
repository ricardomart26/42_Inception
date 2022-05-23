
echo "****************** DOCKER LOGS ******************\n"

echo "WORDPRESS LOGS:" 
sudo docker logs wordpress; echo 

echo "MARIADB LOGS:" 
sudo docker logs mariadb; echo

echo "NGINX LOGS:" 
sudo docker logs nginx; echo 
