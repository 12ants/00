
##################################################
####-OPEN-LITE-SPEED----SERVER-INSTALL-###########
##################################################
############


clear;
echo -e "\v -- OpenLiteSpeed - Server Installation \v";
tput setaf 22; read -ep "	admiuser:       " -i "john" USERNAME;
tput setaf 24; read -ep "	adminpassword:  " -i "hmmmm" PASSWORD;
tput setaf 25; read -ep "	url:            " -i "hello.com" SITEDOMAIN;
tput setaf 26; read -ep "	password:       " -i "pass" PASSWORD;
tput setaf 27; read -ep "	e-mail:         " -i "hello@gmail.com" EMAIL;
tput setaf 28; read -ep "	wp path:        " -i "/var/www/$SITEDOMAIN" WP_PATH;
tput setaf 29; read -ep "	wp username:    " -i "hello" WP_USER;
tput setaf 15; read -ep "	wp password:    " -i "ononono" WPPASSWORD; sleep 1;

wget https://raw.githubusercontent.com/litespeedtech/ols1clk/master/ols1clk.sh;
./ols1clk.sh --lsphp 82	--verbose --adminuser $USERNAME	--adminpassword $PASSWORD  --wordpressplus $SITEDOMAIN --email $EMAIL --wordpresspath $WP_PATH --wpuser $WP_USER --wppassword $WPPASSWORD;

