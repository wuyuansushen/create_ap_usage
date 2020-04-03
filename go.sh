#Author:
#______________________ ________ 
#\_   _____/\_   _____//  _____/ 
# |    __)   |    __)_/   \  ___ 
# |     \    |        \    \_\  \
# \___  /   /_______  /\______  /
#     \/            \/        \/ 
#Date:2020-04-03
#Version:1.0
#Mail:wuyuansushen@gmail.com
#Auto-Configuration WIFI Access Point base on project 'https://github.com/oblique/create_ap'

#!/bin/bash
apt update
apt install git -y
apt install bash util-linux procps hostapd iproute2 iw -y
git clone https://github.com/oblique/create_ap.git
cd ./create_ap
make install
ifconfig > ./ifconfig_data 
Wlan=$(cat ./ifconfig_data | grep -e "^wl" | awk -F ":" '{print $1}')
Physical=$(cat ./ifconfig_data | grep -e "^en" | awk -F ":" '{print $1}')
WlanLine=$(cat /etc/create_ap.conf | grep -ne "^WIFI_IFACE" | awk -F ":" '{print $1}')
PhyLine=$(cat /etc/create_ap.conf | grep -ne "^INTERNET_IFACE" | awk -F ":" '{print $1}')
SSIDLine=$(cat /etc/create_ap.conf | grep -ne "^SSID" | awk -F ":" '{print $1}')
PassLine=$(cat /etc/create_ap.conf | grep -ne "^PASSPHRASE" | awk -F ":" '{print $1}')
sed -i "${WlanLine}d" /etc/create_ap.conf
sed -i "$((${WlanLine}-1))a WIFI_IFACE=${Wlan}" /etc/create_ap.conf
sed -i "${PhyLine}d" /etc/create_ap.conf
sed -i "$((${PhyLine}-1))a INTERNET_IFACE=${Physical}" /etc/create_ap.conf
echo "Your WIFI Name:"
read WIFIName
sed -i "${SSIDLine}d" /etc/create_ap.conf
sed -i "$((${SSIDLine}-1))a SSID=${WIFIName}" /etc/create_ap.conf
echo "Your WIFI Password:"
read WIFIPassword
sed -i "${PassLine}d" /etc/create_ap.conf
sed -i "$((${PassLine}-1))a PASSPHRASE=${WIFIPassword}" /etc/create_ap.conf
cd ..
rm -r ./create_ap
cd ..
rm -r ./create_ap_usage
cd ~
systemctl daemon-reload
systemctl start create_ap.service
