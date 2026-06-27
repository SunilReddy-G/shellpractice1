#!/bin/bash

sudo systemctl stop httpd
sudo rm -f /var/www/html/*
sudo dnf remove httpd wget unzip -y