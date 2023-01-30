#!/bin/bash
sudo yum -y update

echo "Install httpd"
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd

echo "Install git"
yum install -y git

echo "Install Docker engine"
yum install docker -y
systemctl start docker
systemctl enable docker