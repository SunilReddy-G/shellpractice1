#!/bin/bash
# this script prints system info

echo "This is my fist Bashscript"
echo
echo "###################################"
echo "this is uptime of the script"
uptime

echo "###################################"
echo "Memory utilization"
free -m

echo "###################################"
echo " Disk utilization"
df -h