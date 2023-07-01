#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############

###########- END COLOR CODE -##########

echo -e " $COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• ADD HOST/DOMAIN •      ${NC} $COLOR1 $NC"
echo -e " $COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌─────────────────────────────────────────────────┐${NC}"
read -rp "  Add Host/Domain : " -e dns
echo ""
if [ -z $dns ]; then
echo -e "  [INFO] Type Your Domain/sub domain"
echo -e " $COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu
else
echo "IP=$dns" > /var/lib/ipvps.conf
echo "$dns" > /etc/xray/domain
echo "$dns" > /etc/v2ray/domain
echo ""
echo "  [INFO] Dont forget to renew cert"
echo ""
echo -e " $COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "  Press any key to Renew Certv2ray"
genssl
fi
