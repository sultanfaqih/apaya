#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m" 
COLOR1="\033[1;36m"
COLBG1="\e[1;97;101m"              
# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}              • SERVER STATUS •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
systemctl daemon-reload
echo -e "   [INFO] • Starting ...                        "
sleep 1
systemctl restart ssh
echo -e "   [INFO] • Restarting SSH Services             "
sleep 1
systemctl restart squid
echo -e "   [INFO] • Restarting Squid Services           "
sleep 1
systemctl restart nginx
echo -e "   [INFO] • Restarting Nginx Services           "
sleep 1
systemctl restart dropbear
echo -e "   [INFO] • Restarting Dropbear Services        "
sleep 1
systemctl restart ws-dropbear
echo -e "   [INFO] • Restarting Ws-Dropbear Services     "
sleep 1
systemctl restart ws-stunnel
echo -e "   [INFO] • Restarting Ws-Stunnel Services      "
sleep 1
systemctl restart stunnel4
echo -e "   [INFO] • Restarting Stunnel4 Services        "
sleep 1
systemctl restart xray
echo -e "   [INFO] • Restarting Xray Services            "
sleep 1
systemctl restart cron
echo -e "   [INFO] • Restarting Cron Services            "
echo -e "   [INFO] • All Services Restates Successfully  "
sleep 1
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu
