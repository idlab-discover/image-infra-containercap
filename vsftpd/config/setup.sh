#!/bin/bash
# create FTP user greg and default repository
useradd -m greg
echo 'greg:greg' | chpasswd
mkdir -p /home/greg/ftp/files
chown nobody:nogroup /home/greg/ftp
chmod a-w /home/greg/ftp
chown greg:greg /home/greg/ftp/files
# add FTP user greg to user list
echo "greg" > /etc/vsftpd.user_list
# configure SSH (the key must not be encrypted as vsftpd can not deal with this)
openssl genpkey -algorithm RSA -out /etc/ssl/private/My-FTP-Server.pem
openssl req -new -key /etc/ssl/private/My-FTP-Server.pem -subj "/C=BE/ST=West-Vlaanderen/L=Brugge/O=SimonCorp/OU=IT/CN=simoncorp.com" | \
openssl x509 -req -days 365 -signkey /etc/ssl/private/My-FTP-Server.pem -out /etc/ssl/certs/My-FTP-Server.pem
# edit configuration file
echo "user_sub_token=\$USER" >> /etc/vsftpd.conf
echo "local_root=/home/\$USER/ftp" >> /etc/vsftpd.conf
echo "pasv_min_port=38426" >> /etc/vsftpd.conf
echo "pasv_max_port=38458" >> /etc/vsftpd.conf
echo "port_enable=NO" >> /etc/vsftpd.conf
echo "userlist_deny=NO" >> /etc/vsftpd.conf
echo "userlist_enable=YES" >> /etc/vsftpd.conf
echo "chmod_enable=NO" >> /etc/vsftpd.conf
echo "delete_failed_uploads=YES" >> /etc/vsftpd.conf
echo "max_clients=32" >> /etc/vsftpd.conf
echo "max_per_ip=3" >> /etc/vsftpd.conf
echo "ssl_ciphers=AES256-SHA" >> /etc/vsftpd.conf
sed -i "s/^#\?write_enable.*/write_enable=YES/" /etc/vsftpd.conf
sed -i "s/^#\?idle_session_timeout.*/idle_session_timeout=180/" /etc/vsftpd.conf
sed -i "s/^#\?data_connection_timeout.*/data_connection_timeout=180/" /etc/vsftpd.conf
sed -i "s/^#\?chroot_local_user.*/chroot_local_user=YES/" /etc/vsftpd.conf
sed -i "s/^#\?connect_from_port_20.*/connect_from_port_20=NO/" /etc/vsftpd.conf
sed -i "s/^#\?ssl_enable.*/ssl_enable=YES/" /etc/vsftpd.conf
sed -i "s/^#\?rsa_cert_file.*/rsa_cert_file=\/etc\/ssl\/certs\/My-FTP-Server.pem/" /etc/vsftpd.conf
sed -i "s/^#\?rsa_private_key_file.*/rsa_private_key_file=\/etc\/ssl\/private\/My-FTP-Server.pem/" /etc/vsftpd.conf