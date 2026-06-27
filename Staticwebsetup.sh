#!/bin/bash

# install dependencies
echo "#####################################"
echo "Install packages"
echo "#####################################"
sudo dnf install wget unzip httpd -y > /dev/null
echo

# start and enabled service
echo "#####################################"
echo "Start & enable HTTPD services"
echo "#####################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Creating temp directory
echo "#####################################"
echo "Starting Artifact Deployment"
echo "#####################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles/
echo

 
wget https://www.tooplate.com/zip-templates/2160_exhibit_studio.zip > /dev/null
unzip 2160_exhibit_studio.zip > /dev/null
sudo cp -r 2160_exhibit_studio/* /var/www/html/
echo

# Bounce service
echo "#####################################"
echo "Restarting HTTPD Services"
echo "#####################################"
sudo systemctl restart httpd
echo

# clean up
echo "#####################################"
echo "Remove temporary files"
echo "#####################################"
rm -rf /tmp/webfiles
echo

sudo systemctl status httpd

ls /var/www/html/