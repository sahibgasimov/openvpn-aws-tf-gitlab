#!/bin/bash
sudo -i
#enables password auth log in for openvpn server
sed 's/PasswordAuthentication no/PasswordAuthentication yes/' -i /etc/ssh/sshd_config
systemctl restart sshd
service sshd restart
adduser --quiet --disabled-password --shell /bin/bash --home /home/sahib --gecos "User" sahib
usermod -aG sudo,admin username
echo "username:password" | chpasswd
#shows password for openvpn user
cat /usr/local/openvpn_as/init.log|grep -i 'account with' |awk '{print $9}' >> passwd.txt
