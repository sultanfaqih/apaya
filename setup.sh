#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
###
BURIQ () {
    curl -sS https://raw.githubusercontent.com/MyRidwan/izinvps/ipuk/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f  /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f  /root/tmp
}
# https://raw.githubusercontent.com/MyRidwan/izinvps/ipuk/ip 
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/MyRidwan/izinvps/ipuk/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/MyRidwan/izinvps/ipuk/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
if [ -f "/root/log-install.txt" ]; then
rm -fr /root/log-install.txt
fi

mkdir -p /etc/xray

mkdir -p /etc/v2ray

touch /etc/xray/domain

touch /etc/v2ray/domain

touch /etc/xray/scdomain

touch /etc/v2ray/scdomain

ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1

sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

apt install git curl -y >/dev/null 2>&1

apt install python -y >/dev/null 2>&1

echo -e "[ ${green}INFO${NC} ] Aight good ... installation file is ready"

sleep 2

mkdir -p /var/lib/scrz-prem >/dev/null 2>&1

echo "IP=" >> /var/lib/scrz-prem/ipvps.conf

wget -q https://raw.githubusercontent.com/sultanfaqih/apaya/main/tools.sh;chmod +x tools.sh;./tools.sh

rm tools.sh

clear

clear

echo -e "════════════════════════════════════════" | lolcat
echo -e "█████████" | lolcat
echo -e "█▄█████▄█╔╦╗╔═╦╗╔══╗╔═╗╔═╗╔═╗─╔╗╔═╗╔═╗╔══╗" | lolcat
echo -e "█▼▼▼▼▼   ║╔╝╚╗║║╚╗╔╝║╬║║╬║║║║─║║║╦╝║╔╝╚╗╔╝ " | lolcat
echo -e "█.       ║╚╗╔╩╗║─║║─║╔╝║╗╣║║║╔╣║║╩╗║╚╗─║║─ " | lolcat
echo -e "█▲▲▲▲▲   ╚╩╝╚══╝─╚╝─╚╝─╚╩╝╚═╝╚═╝╚═╝╚═╝─╚╝─ " | lolcat
echo -e "█████████ " | lolcat
echo -e " ██ ██ " | lolcat
echo -e "════════════════════════════════════════" | lolcat
echo -e "            [Free Internet]" | lolcat
echo -e "════════════════════════════════════════" | lolcat
    echo -e "${red}    ♦️${NC} ${green} CUSTOM SETUP DOMAIN VPS     ${NC}"
    echo -e "${red}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
    echo "1. Use Domain From Script / Gunakan Domain Dari Script"
    echo "2. Choose Your Own Domain / Pilih Domain Sendiri"
    echo -e "${red}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
    read -rp "Choose Your Domain Installation : " dom 

    if test $dom -eq 1; then
    clear
    apt install jq curl -y
    wget -q -O /root/cf "https://raw.githubusercontent.com/sultanfaqih/tes/main/cf" >/dev/null 2>&1
    chmod +x /root/cf
    bash /root/cf | tee /root/install.log
    echo "DONE"
    sleep 3
    elif test $dom -eq 2; then
    read -rp "Enter Your Domain : " domen 
    echo $domen > /root/domain
    echo "$domen" > /root/domain
    echo "$domen" > /root/scdomain
    echo "$domen" > /etc/xray/domain
    echo "$domen" > /etc/xray/scdomain
    echo "IP=$domen" > /var/lib/ipvps.conf
    cp /root/domain /etc/xray/domain
    else 
    echo "Not Found Argument"
    exit 1
    fi
    echo -e "${GREEN}Done!${NC}"
    sleep 2
    clear

echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo -e "$green      Install SSH / WS               $NC"

echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

sleep 2

clear

wget https://raw.githubusercontent.com/sultanfaqih/apaya/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh

sleep 2

clear

wget https://raw.githubusercontent.com/sultanfaqih/apaya/main/nginx-ssl.sh && chmod +x nginx-ssl.sh && ./nginx-ssl.sh

echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo -e "$green      Install Websocket              $NC"

echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

sleep 2

clear

wget https://raw.githubusercontent.com/sultanfaqih/apaya/main/insshws.sh && chmod +x insshws.sh && ./insshws.sh

cd /usr/bin

wget -O xp "https://raw.githubusercontent.com/sultanfaqih/apaya/main/xp.sh"

chmod +x xp

sleep 1

wget -q -O /usr/bin/notramcpu "https://raw.githubusercontent.com/sultanfaqih/apaya/main/Menu%20Final/Lain/notramcpu" && chmod +x /usr/bin/notramcpu

cd

rm -f /root/ins-xray.sh

rm -f /root/insshws.sh

rm -f /root/xraymode.sh

wget -q -O ins-xray.sh https://raw.githubusercontent.com/sultanfaqih/apaya/main/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh

sleep 1

wget -q -O senmenu.sh https://raw.githubusercontent.com/sultanfaqih/apaya/main/senmenu.sh && chmod +x senmenu.sh && ./senmenu.sh

wget -q -O slow.sh https://raw.githubusercontent.com/sultanfaqih/apaya/main/slow.sh && chmod +x slow.sh && ./slow.sh

mkdir /root/akun

mkdir /root/akun/vmess

mkdir /root/akun/vless

mkdir /root/akun/shadowsocks

mkdir /root/akun/trojan

echo "0 5 * * * root reboot" >> /etc/crontab

echo "* * * * * root clog" >> /etc/crontab

echo "59 * * * * root pkill 'menu'" >> /etc/crontab

echo "0 1 * * * root xp" >> /etc/crontab

echo "*/5 * * * * root notramcpu" >> /etc/crontab

service cron restart

clear

org=$(curl -s https://ipapi.co/org )

echo "$org" > /root/.isp

cat> /root/.profile << END

if [ "$BASH" ]; then

if [ -f ~/.bashrc ]; then

. ~/.bashrc

fi

fi

mesg n || true

clear

menu

END

chmod 644 /root/.profile

if [ -f "/root/log-install.txt" ]; then

rm -fr /root/log-install.txt

fi

cd

echo "1.0.0" > versi

clear

rm -f ins-xray.sh

rm -f senmenu.sh

rm -f setupku.sh

rm -f xraymode.sh

rm -f slow.sh

echo "Jangan Takut Gagal, Kalau Takut Kegagalan Mending Main Boneka" > bacasaya

echo "YT: @Franata775" > readme

echo "=====================-[ F75.ID ]-===================="

echo ""

echo "------------------------------------------------------------"

echo ""

echo "   >>> Service & Port"  | tee -a log-install.txt

echo "   - OpenSSH                 : 22, 53, 2222, 2269"  | tee -a log-install.txt

echo "   - SSH Websocket           : 80" | tee -a log-install.txt

echo "   - SSH SSL Websocket       : 443" | tee -a log-install.txt

echo "   - Stunnel5                : 222, 777" | tee -a log-install.txt

echo "   - Dropbear                : 109, 143" | tee -a log-install.txt

echo "   - Badvpn                  : 7100-7300" | tee -a log-install.txt

echo "   - Nginx                   : 81" | tee -a log-install.txt

echo "   - XRAY  Vmess TLS         : 443" | tee -a log-install.txt

echo "   - XRAY  Vmess None TLS    : 80" | tee -a log-install.txt

echo "   - XRAY  Vless TLS         : 443" | tee -a log-install.txt

echo "   - XRAY  Vless None TLS    : 80" | tee -a log-install.txt

echo "   - Trojan GRPC             : 443" | tee -a log-install.txt

echo "   - Trojan WS               : 443" | tee -a log-install.txt

echo "   - Trojan GO               : 443" | tee -a log-install.txt

echo "   - Sodosok WS/GRPC         : 443" | tee -a log-install.txt

echo ""  | tee -a log-install.txt

echo "   >>> Server Information & Other Features"  | tee -a log-install.txt

echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt

echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt

echo "   - Dflate                  : [ON]"  | tee -a log-install.txt

echo "   - IPtables                : [ON]"  | tee -a log-install.txt

echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt

echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt

echo "   - Autobackup Data" | tee -a log-install.txt

echo "   - AutoKill Multi Login User" | tee -a log-install.txt

echo "   - Auto Delete Expired Account" | tee -a log-install.txt

echo "   - Fully automatic script" | tee -a log-install.txt

echo "   - VPS settings" | tee -a log-install.txt

echo "   - Admin Control" | tee -a log-install.txt

echo "   - Change port" | tee -a log-install.txt

echo "   - Restore Data" | tee -a log-install.txt

echo "   - Full Orders For Various Services" | tee -a log-install.txt

echo ""

echo ""

echo "------------------------------------------------------------"

echo ""

echo "===============-[ BY: Franata775.COM ]-==============="

echo -e ""

echo ""

echo "" | tee -a log-install.txt

echo "Franata"

sleep 1

clear

echo -ne "[ ${yell}WARNING${NC} ] Do you want to reboot now ? (y/n)? "

read answer

if [ "$answer" == "${answer#[Yy]}" ] ;then

exit 0

else

reboot

fi
