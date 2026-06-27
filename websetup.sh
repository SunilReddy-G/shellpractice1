#!/bin/bash

# install dependencies
ech"#####################################"
echo "install packages."
echo"####################################"
sudo dnf install wget unzip httpd -y > /dev/null
echo

# start and enabled service
ech"#####################################"
echo"Start & enables HTTPD services"
ech"#####################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Creating temp directory
ech"#####################################"
echo"Starting Artifact Deployment"
ech"#####################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles/
echo

 
wget https://www.tooplate.com/zip-templates/2160_exhibit_studio.zip > /dev/null
unzip 2160_exhibit_studio.zip > /dev/null
sudo cp -r 2160_exhibit_studio/* /var/www/html/
echo

# Bounce service
ech"#####################################"
echo"Restarting HTTPD Services"
ech"#####################################"
sudo systemctl restart httpd
echo

# clean up
ech"#####################################"
echo"Remove temporary files"
ech"#####################################"
rm -rf /tmp/webfiles
echo
