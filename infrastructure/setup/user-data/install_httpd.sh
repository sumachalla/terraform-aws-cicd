#! /bin/bash
yum install httpd -y
echo "<h1>Deployed by terraform </h1>" > /var/www/html/index.html
chkconfig httpd on
service httpd start
yum install java-1.8.0-openjdk -y
yum remove java-1.7.0-openjdk -y