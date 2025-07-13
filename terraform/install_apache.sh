#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "3-Tier Architecture is Live from SANJITH" > /var/www/html/index.html
