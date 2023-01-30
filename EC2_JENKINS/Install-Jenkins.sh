#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

echo "Install apache2"
sudo apt install -y apache2
sudo service apache2 start
sudo service apache2 enable
echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html

echo "Install Java JDK"
sudo apt install openjdk-8-jre-headless

echo "Install Jenkins"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'

sudo apt-get update -y
sudo apt-get install jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo systemctl enable jenkins