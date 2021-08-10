#!/bin/bash
echo "executing on $HOSTNAME"
echo "executing as user $(whoami)"
echo "executing on $(date +%F)"
echo "------------------------------------------------"
echo "priting restart related details"
echo "last reboot detials"
last | grep reboot | head -n1
echo "load average and uptime"
uptime
echo "-----------------------------------------------"
echo "printing system information"
echo "current kernel version"
uname -a | awk '{print $3}'
echo "hardware information"
echo "printing memory information"
free -m | awk  '{print $1,$2;}' | sed 's/total/     Available/' | sed 's/used//'
echo "printing disk usage infomration"
df -TH | grep -v tmpfs
echo "listing network devices"
nmcli device show | grep -i device | grep -v lo | awk '{print $2}'

