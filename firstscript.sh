#!/bin/bash
### this script prints system info ###

echo "This is my fist Bashscript"
echo

# checking the system uptime
echo "###################################"
echo "this is uptime of the script"
uptime

# Memory utilization
echo "###################################"
echo "Memory utilization"
free -m

# disk utilization
echo "###################################"
echo " Disk utilization"
df -h