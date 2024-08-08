#!/bin/bash

# Create a new user with a password
USERNAME=${1:-user}
PASSWORD=${2:-1mp0ss1bl3P4ssw0rd!}
useradd -m -s /bin/bash "$USERNAME"
echo "$USERNAME:$PASSWORD" | chpasswd

# Enable password authentication, except for root
sed -i "s/^#\?PasswordAuthentication .*/PasswordAuthentication yes/" /etc/ssh/sshd_config
sed -i "s/^#\?PermitRootLogin .*/PermitRootLogin no/" /etc/ssh/sshd_config
sed -i "s/^#\?MaxStartups .*/MaxStartups 50:30:100/" /etc/ssh/sshd_config
