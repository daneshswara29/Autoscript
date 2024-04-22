#!/bin/bash

BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

BURIQ () {
    curl -sS https://raw.githubusercontent.com/daneshswara29/izin/main/ip > /root/tmp
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
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/daneshswara29/izin/main/ip | grep $MYIP | awk '{print $2}')
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
    IZIN=$(curl -sS https://raw.githubusercontent.com/daneshswara29/izin/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
clear
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                  MENU SETTINGS                  │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e " ┌───────────────────────────────────────────────┐" | lolcat
echo -e "   ${BICyan}[${BIGreen}1${BICyan}]${BIGreen}  ADD Host/Domain${NC}"
echo -e "   ${BICyan}[${BIGreen}2${BICyan}]${BIGreen}  Renew CertXRAY${NC}"
echo -e "   ${BICyan}[${BIGreen}3${BICyan}]${BIGreen}  Check Running${NC}"
echo -e "   ${BICyan}[${BIGreen}4${BICyan}]${BIGreen}  Change Banner SSH${NC} "
echo -e "   ${BICyan}[${BIGreen}5${BICyan}]${BIGreen}  Info-Bandwidth${NC}"
echo -e "   ${BICyan}[${BIGreen}6${BICyan}]${BIGreen}  Restart${NC}"
echo -e "   ${BICyan}[${BIGreen}7${BICyan}]${BIGreen}  Auto Reboot${NC}"
echo -e "   ${BICyan}[${BIGreen}8${BICyan}]${BIGreen}  Reboot${NC}"
echo -e "   ${BICyan}[${BIGreen}9${BICyan}]${BIGreen}  SpeedTest${NC}"
echo -e "   ${BICyan}[${BIGreen}10${BICyan}]${BIGreen} Limit Speed${NC}"
echo -e "   ${BICyan}[${BIGreen}11${BICyan}]${BIGreen} Webmin${NC}"
echo -e "   ${BICyan}[${BIGreen}12${BICyan}]${BIGreen} UPDATE SCRIPT${NC}"
echo -e "   ${BICyan}[${BIGreen}13${BICyan}]${BIGreen} Tendang User Mullog${NC}"
echo -e "   ${BICyan}[${BIGreen}14${BICyan}]${BIGreen} About SCRIPT${NC}"
echo -e "   ${BICyan}[${BIGreen}15${BICyan}]${BIGreen} Atur Jam Reboot${NC}"
echo -e "   ${BICyan}[${BIGreen}16${BICyan}]${BIGreen} INSTALL UDP${NC}"
echo -e "   ${BICyan}[${BIGreen}17${BICyan}]${BIGreen} INSTALL UDPGW MINI${NC}"
echo -e "   ${BICyan}[${BIGreen}0${BICyan}]${BIGreen}  Back To Menu${NC}"
echo -e "   ${BICyan}[${BIGreen}x${BICyan}]${BIGreen}  Exit${NC}"
echo -e " └───────────────────────────────────────────────┘" | lolcat
echo -e ""
read -p "  Select menu :  "  opt
echo -e   ""
case $opt in
01 | 1) clear ; addhost ;;
02 | 2) clear ; certxray ;;
03 | 3) clear ; running ;;
04 | 4) clear ; nano /etc/issue.net ;;
05 | 5) clear ; cek-bandwidth ;;
06 | 6) clear ; restart ;;
07 | 7) clear ; autoreboot ;;
08 | 8) clear ; reboot ;;
09 | 9) clear ; speedtest ;;
10 | 10) clear ; limitspeed ;;
11 | 11) clear ; webmin ;;
12 | 12) clear ; update ;;
13 | 13) clear ; tendang ;;
14 | 14) clear ; about ;;
15 | 15) clear ; jam ;;
16 | 16) clear ; wget https://raw.githubusercontent.com/daneshswara29/v6/main/udpcustom/udp-custom.sh && chmod +x udp-custom.sh && ./udp-custom.sh ;;
17 | 17) clear ;
echo -e "PROSES INSTALASI UDPGW MINI 7100, 7200, 7300"; sleep 5;

mkdir -p /usr/local/kyt/
wget -q -O /usr/local/kyt/udp-mini "https://raw.githubusercontent.com/daneshswara29/v6/main/udpcustom/udp-mini"
chmod +x /usr/local/kyt/udp-mini
wget -q -O /etc/systemd/system/udp-mini-1.service "https://raw.githubusercontent.com/daneshswara29/v6/main/udpcustom/udp-mini-1.service"
wget -q -O /etc/systemd/system/udp-mini-2.service "https://raw.githubusercontent.com/daneshswara29/v6/main/udpcustom/udp-mini-2.service"
wget -q -O /etc/systemd/system/udp-mini-3.service "https://raw.githubusercontent.com/daneshswara29/v6/main/udpcustom/udp-mini-3.service"
systemctl disable udp-mini-1
systemctl stop udp-mini-1
systemctl enable udp-mini-1
systemctl start udp-mini-1
systemctl disable udp-mini-2
systemctl stop udp-mini-2
systemctl enable udp-mini-2
systemctl start udp-mini-2
systemctl disable udp-mini-3
systemctl stop udp-mini-3
systemctl enable udp-mini-3
systemctl start udp-mini-3

echo -e "INSTALASI SUCCESS UDPGW MINI 7100, 7200, 7300"; sleep 5;
exit ;;
00 | 0) clear ; menu ;;
x) exit ;;
*) clear ; menu-set ;;
esac
