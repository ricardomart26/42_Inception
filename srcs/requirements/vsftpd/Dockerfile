
# links
# https://shiftedbits.org/2012/01/29/enable-wordpress-automatic-updates-on-a-debian-server/
# https://ubunlog.com/pt/vsftpd-instalar-un-servidor-ftp-ubuntu/
# https://pplware.sapo.pt/linux/vsftpd-criar-um-servidor-ftp-seguro-em-5-minutos-no-debian-parte-1/
# https://askubuntu.com/questions/14371/how-to-setup-ftp-to-use-in-locally-hosted-wordpress

FROM debian:10.11



RUN apt-get update -y
RUN apt-get install vsftpd openssl

COPY tools/vsftpd.conf /etc/vsftpd.conf

# Add the user
RUN useradd ftpsecure -d /var/www -s /usr/sbin/nologin

# Set a password. Since vsftpd is only listening on localhost, the 
# security of this password isn't too important.
# Para definir a password, devem executar o seguinte comando:
RUN passwd ftpsecure

# Add to the vsftpd allow list
# Por fim, para adicionar o utilizador à lista de utilizadores, utilize o seguinte comando:
RUN echo "ftpsecure" | tee -a /etc/vsftpd.allow_list
