#!/bin/bash

# create FTP user greg and default repository

useradd -m greg
echo 'greg:greg' | chpasswd
mkdir /home/greg/ftp
chown nobody:nogroup /home/greg/ftp
chmod a-w /home/greg/ftp
mkdir /home/greg/ftp/files
chown greg:greg /home/greg/ftp/files

# add FTP user greg to user list

echo "greg" > /etc/vsftpd.user_list

# configure SSH (the key must not be encrypted as vsftpd can not deal with this)

openssl genpkey -algorithm RSA -out key.pem
openssl req -new -key key.pem -out req.pem -subj "/C=BE/ST=West-Vlaanderen/L=Brugge/O=SimonCorp/OU=IT/CN=simoncorp.com"
openssl x509 -req -days 365 -signkey key.pem -in req.pem -out cert.pem
cp cert.pem /etc/ssl/certs/My-FTP-Server.pem
cp key.pem /etc/ssl/private/My-FTP-Server.pem

# restart service

/usr/sbin/vsftpd
