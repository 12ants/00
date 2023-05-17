
##################################################
####-OPEN-LITE-SPEED----SERVER-INSTALL-###########
##################################################
############


# Use the following command to add our Debian repository:
# Debian 7, 8, 9, 10, 11 & Ubuntu 14,16,18, 20, 22 :
wget -O - https://repo.litespeed.sh | sudo bash
apt update;
clear;
echo -e "\v -- OpenLiteSpeed - Server Installation \v";
tput setaf 22; read -ep "     admiuser: " -i "john" USERNAME;
tput setaf 24; read -ep "adminpassword: " -i "hmmmm" PASSWORD;
tput setaf 25; read -ep "          url: " -i "hello.com" SITEDOMAIN;
tput setaf 26; read -ep "     password: " -i "pass" PASSWORD;
tput setaf 27; read -ep "       e-mail: " -i "hello@gmail.com" EMAIL;
tput setaf 28; read -ep "      wp path: " -i "/var/www/$SITEDOMAIN" WP_PATH;
tput setaf 29; read -ep "  wp username: " -i "hello" WP_USER;
tput setaf 15; read -ep "  wp password: " -i "ononono" WPPASSWORD;
echo;
apt install openlitespeed
apt install -y lsphp81 lsphp81-common lsphp81-curl lsphp81-mysql lsphp81-opcache lsphp81-imap lsphp81-opcache 


wget https://raw.githubusercontent.com/litespeedtech/ols1clk/master/ols1clk.sh;
bash ols1clk.sh --adminuser $USERNAME --adminpassword $PASSWORD --wordpressplus $SITEDOMAIN --email $EMAIL --wordpresspath $WP_PATH --wpuser $WP_USER --wppassword $WPPASSWORD --lsphp 81 --verbose 
