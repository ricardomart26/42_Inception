
# openssl: comand line tool to create and manage certificates
# req: Especifica que queremos usar o certificado X.509, que é um certificate signing request (CSR).
# O X.509 é uma infraestrutura que o SSL e TLS usa para gerir as chaves e certificados.
# -x509: Modifica o comando anterior (req) para indicar que vai ser um certificado self-signed em vez
# de gerar um certificate signing request (csr) como aconteceria normalmente
# -days 365: Tempo que o certificado que vai ser valido
# -newkey rsa:2048: Especifica que queremos gerar um novo certificado e uma nova chave ao mesmo tempo
# O rsa:2048 criar uma RSA key que tem 2048 bits.
# -keyout: Onde meter a private key que criamos
# -out: Onde meter o certificado que criamos

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt << EOF
PT
Lisboa
Lisboa
42 School
42 Lisboa
rimartin
ricardomartins2626t@gmail.com
EOF