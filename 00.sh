#!/bin/bash
## Install-script for Ubuntu/Debian systems
## visit https://12ants.github.io for credits
if [ $UID != 0 ]; then echo -e " \n\n\t This script must be run as root... try command: [ sudo -s ] \n\n " 1>&2; exit 1; fi; ## ROOT-CHECK
reset
rootgit="12ants.github.io/00";
ipnet="hostname -I"
ippublic="dig +short myip.opendns.com @resolver1.opendns.com"
## ADDING COLOR-CODES -- (Need to run inside other command.)
export bold=$(tput bold) dim=$(tput dim) so=$(tput smso) noso=$(tput rmso) rev=$(tput rev) re=$(tput sgr0) normal=$(tput sgr0) \
redb=$(tput setab 1) greenb=$(tput setab 2) yellowb=$(tput setab 3) blueb=$(tput setab 4) purpleb=$(tput setab 5) cyanb=$(tput setab 6) \
grayb=$(tput setab 7) red=$(tput setaf 1) green=$(tput setaf 2) yellow=$(tput setaf 3) blue=$(tput setaf 4) purple=$(tput setaf 5) \
cyan=$(tput setaf 6) gray=$(tput setaf 7) white=$(tput setaf 7 bold) pink=$(tput setaf 5 bold) darkblue=$(tput setab 5 bold) blink=$(tput blink) \
left2=$(tput cub 2) up1=$(tput cuu1) c75="  ---------------------------------------------------------------------------"; clear; echo ; c2="$cyan --$re";
## WELCOME-SCREEN
inst="/home/00/"; mkdir -p $inst; chmod 775 $inst; clear;
echo -e "
  $c2  Welcome to$pink Linux-tweaks$re by$green 12ants.com$re
  $c2  Please choose preferred actions \n \n ";
read -ep "  $c2  Root repo for install-files: [Press Enter to continue] " -i "${rootgit}" rootgit;
read -ep "  $c2  update system? [y/n]: " -i "n" "upsys";
##
if [ $upsys == y ]; then echo "ok";
apt update; apt -y upgrade; apt -y install curl wget; clear;
else echo "OK"; fi; cd $inst;
echo -n "    -- $blue Network IP:$cyan "; $ipnet;
echo -n "    -- $purple Public  IP:$cyan "; $ippublic;

##############################
######## INSTALLER ###########
######################
echo -e "\n\n\t $c2 $pink Software installation$re -- \n\n"

echo -e  "  $c2  install$green sudo-color? $re                 [y/n]: " ;
echo -e  "  $c2  install$green cloudpanel-regular? $re         [y/n]: " ;
echo -e  "  $c2  install$green cloudpanel-cracked? $re         [y/n]: " ;
echo -e  "  $c2  install$green hestia-web-server? $re          [y/n]: " ;
echo -e  "  $c2  install$green guake? $re                      [y/n]: " ;
echo -e  "  $c2  install$green custom-grub? $re                [y/n]: " ;
echo -e  "  $c2  install$green 4xfce GUI-OS? $re               [y/n]: " ;
echo -e  "  $c2  install$green login-screen? $re               [y/n]: " ;
echo -e  "  $c2  install$green webmin? $re                     [y/n]: " ;
echo -e  "  $c2  install$green openlitespeed? $re              [y/n]: " ;
tput cuu1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; 
read -ep  "  $c2  install$green sudo-color? $re                 [y/n]: " -i "n" "autocolor"
read -ep  "  $c2  install$green cloudpanel-regular? $re         [y/n]: " -i "n" "cpr"
read -ep  "  $c2  install$green cloudpanel-cracked? $re         [y/n]: " -i "n" "cpc"
read -ep  "  $c2  install$green hestia-web-server? $re          [y/n]: " -i "n" "hestia"
read -ep  "  $c2  install$green guake? $re                      [y/n]: " -i "n" "guake"
read -ep  "  $c2  install$green custom-grub? $re                [y/n]: " -i "n" "grub"
read -ep  "  $c2  install$green 4xfce GUI-OS? $re               [y/n]: " -i "n" "xfce"
read -ep  "  $c2  install$green login-screen? $re               [y/n]: " -i "n" "login"
read -ep  "  $c2  install$green webmin? $re                     [y/n]: " -i "n" "webmin"
read -ep  "  $c2  install$green openlitespeed? $re              [y/n]: " -i "n" "ols"



echo -e "$purple ---------------------------------------------$re "
read -ep "  $c2 $yellow begin installation? $re         [y/n]: " -i "n" "continue"
  
if [ $continue == y ]; then echo -e "\n\n\t --$cyan OK$re -- \n\n"; else exit 1; fi; 
## REMEMER TO CHANGE VAR-NAMES.
cd $inst;


##
read -ep "  -- Wich user? " uusr; 
if [ $autocolor == y ]; then echo "installing auto-sudo"; cd /;
touch ~/.bash_aliases; chmod 775 ~/.bash_aliases; touch /home/$uusr/.bashrc;
echo -e 'alias "ipnet"="hostname -I | head -c 13"; alias "ippublic"="dig +short myip.opendns.com @resolver1.opendns.com"; alias "ipports"="lsof -i -P -n";
PS1="\[\e[0;38;5;23m\]$? \[\e[0;2m\]/ \[\e[0;38;5;30m\]$(ipnet) \[\e[0;2m\]/ \[\e[0;38;5;31m\]\u \[\e[0;2m\]/ \[\e[0;38;5;36m\]\w \[\e[0m\]> \[\e[0m\]"' >> /home/$uusr/.bashrc

echo -e 'alias "ipnet"="hostname -I | head -c 13"; alias "ippublic"="dig +short myip.opendns.com @resolver1.opendns.com"; alias "ipports"="lsof -i -P -n";
PS1="\[\e[0;38;5;23m\]$? \[\e[0;2m\]/ \[\e[0;38;5;30m\]$(ipnet) \[\e[0;2m\]/ \[\e[0;38;5;31m\]\u \[\e[0;2m\]/ \[\e[0;38;5;36m\]\w \[\e[0m\]> \[\e[0m\]"' >> ~/.bashrc
echo '
alias "ipnet"="hostname -I | head -c 13"; alias "ippublic"="dig +short myip.opendns.com @resolver1.opendns.com"; alias "ipports"="lsof -i -P -n";
PS1="\[\e[0;38;5;23m\]$? \[\e[0;2m\]/ \[\e[0;38;5;30m\]$(ipnet) \[\e[0;2m\]/ \[\e[0;38;5;31m\]\u \[\e[0;2m\]/ \[\e[0;38;5;36m\]\w \[\e[0m\]> \[\e[0m\]"'
>> /root/.bashrc;
else echo "OK"; fi; cd $inst;

##
if [ $cpc == y ]; then echo "installing cloudpanel";
wget -O 12cloudpanel.sh $rootgit/cloudpanel_ask.sh && bash 12cloudpanel.sh;
else echo "OK"; fi; cd $inst;

##
if [ $cpr == y ]; then echo "installing cloudpanel";
curl -sS https://installer.cloudpanel.io/ce/v2/install.sh -o install.sh; \
echo "3874fff99744cf3afe6f533013282e87c95640e128d1d3998666e2929dc12978 install.sh" | \
sha256sum -c && sudo bash install.sh;
read -ep "   -- System will now reboot... Run installer again to install other apps -- " -i "OK" "kkkkkk"
sleep 11; reboot;
else echo "OK"; fi; cd $inst;


## 
if [ $hestia == y ]; then echo "installing hestia";
wget -O 12hestia.sh https://raw.githubusercontent.com/hestiacp/hestiacp/release/install/hst-install.sh; chmod 775 ./*; bash 12hestia.sh;
else echo "OK"; fi; cd $inst;

##
if [ $guake == y ]; then echo "installing guake";
apt -y install guake;
else echo "OK"; fi; cd $inst;

##
if [ $grub == y ]; then echo "installing grub";
wget -O 12grub.sh $rootgit/grub.sh; bash 12grub.sh;
else echo "OK"; fi; cd $inst;

##
if [ $xfce == y ]; then echo "installing xfce";
apt install -y -qq xfce4-session xfce4-goodies xfce4-panel alsa synaptic xinit luakit firefox guake    #  minimal desktop env
echo -e "\v\t Type [ startx ] to execute \v\v"
else echo "OK"; fi; cd $inst;

##
if [ $login == y ]; then echo "installing login-screen";
wget -O 12login.sh $rootgit/login.sh; bash 12login.sh;
else echo "OK"; fi; cd $inst;

##
if [ $webmin == y ]; then echo "installing webmin";
wget https://download.webmin.com/devel/tarballs/webmin-current.tar.gz;
tar -xf webmin-current.tar.gz --strip-components=1; 
./setup.sh /usr/local/webmin;
else echo "OK"; fi; cd $inst;


## remove install directories
rm $inst -R

##
sleep .5; echo -e "$purple ---------------------------------------------$re "
sleep .5; echo -e "$purple ---------------------------------------------$re "
sleep .5; echo -e "$purple ---------------------------------------------$re "
sleep .5; echo -e "$purple ---------------------------------------------$re "

##
## end - reboot
echo -e "$c2 $green https://12ants.github.io/$re $c2$re
$c2 $pink your ip: $(hostname -I) $re $c2$re
$c2  enjoy!$re $c2$re \v"; tput sgr0;


