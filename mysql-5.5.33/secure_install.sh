#!/bin/bash
 
apt-get -y install expect
 
SECURE_MYSQL=$(expect -c "
 
set timeout 10
spawn /opt/mysql/bin/mysql_secure_installation
 
expect \"Enter current password for root (enter for none):\"
send \"$MYSQL\r\"
 
expect \"Change the root password?\"
send \"n\r\"
 
expect \"Remove anonymous users?\"
send \"y\r\"
 
expect \"Disallow root login remotely?\"
send \"n\r\"
 
expect \"Remove test database and access to it?\"
send \"y\r\"
 
expect \"Reload privilege tables now?\"
send \"y\r\"
 
expect eof
")

mysql -u root -p'' -e "create user 'root'@'%' identified by ''; grant ALL on *.* to 'root'@'%'; flush privileges; "
 
echo "$SECURE_MYSQL"
