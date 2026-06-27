#!/bin/bash

PACKAGE="httpd wget unzip"
SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2160_exhibit_studio.zip"
ART_NAME="2160_exhibit_studio"
TEMPDIR=" /tmp/webfiles"

# install dependencies
echo "#####################################"
echo "Install packages"
echo "#####################################"
sudo dnf install $PACKAGE -y > /dev/null
echo

# start and enabled service
echo "#####################################"
echo "Start & enable HTTPD services"
echo "#####################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Creating temp directory
echo "#####################################"
echo "Starting Artifact Deployment"
echo "#####################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

 
wget $URL > /dev/null
unzip $ART_NAME.zip > /dev/null
sudo cp -r $ART_NAME/* /var/www/html/
echo

# Bounce service
echo "#####################################"
echo "Restarting HTTPD Services"
echo "#####################################"
sudo systemctl restart $SVC
echo

# clean up
echo "#####################################"
echo "Remove temporary files"
echo "#####################################"
rm -rf $TEMPDIR
echo

sudo systemctl status $SVC

ls /var/www/html/