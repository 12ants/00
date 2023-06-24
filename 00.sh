#!/bin/bash
## Install-script for Ubuntu/Debian systems
## visit https://12ants.github.io for credits
if [ $UID != 0 ]; then echo -e " \n\n\t This script must be run as root... try command: [ sudo -s ] \n\n " 1>&2; exit 1; fi; ## ROOT-CHECK
reset
rootgit="https://github.com/12ants/00/raw/main";
##
## Create Backup folder
mkdir -p /var/backedupconf/
bufolder="/var/backedupconf/"
mkdir -p /home/00/ ## install folder
## IP SHOW COMMANDS
ipnet="hostname -I"
ippublic="dig +short myip.opendns.com @resolver1.opendns.com"
ippub="dig +short myip.opendns.com @resolver1.opendns.com"
ipa="echo ---- $blue Network IP:$cyan ; $ipnet; ---- $purple Public  IP:$cyan ; $ippublic;"
alias ipa="echo ---- $blue Network IP:$cyan ; $ipnet; ---- $purple Public  IP:$cyan ; $ippublic;"
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
apt update; apt -y upgrade;
## INSTALL BASIC APPS
apt -y install ssh openssh-server openssl curl wget dnsutils nano
clear
else echo "OK"; fi; cd $inst;
echo -n "    -- $blue Network IP:$cyan "; $ipnet;
echo -n "    -- $purple Public  IP:$cyan "; $ippublic;

##############################
######## INSTALLER ###########
######################
echo -e "\n\n\t $c2 $pink Software installation$re -- \n\n"

echo -e  "  $c2  install$green a better bash? $re                  [y/n]: " ;
echo -e  "  $c2  install$green custom-grub? $re                    [y/n]: " ;
echo -e  "  $c2  install$green login-screen? $re                   [y/n]: " ;
echo -e  "  $c2  install$green webmin? $re                         [y/n]: " ;
echo -e  "  $c2  install$green openlitespeed? $re                  [y/n]: " ;
echo -e  "  $c2  install$green cloudpanel-regular? $re             [y/n]: " ;
echo -e  "  $c2  install$green cloudpanel-cracked? $re             [y/n]: " ;
echo -e  "  $c2  install$green hestia-web-server? $re              [y/n]: " ;
echo -e  "  $c2  install$green guake? $re                          [y/n]: " ;
echo -e  "  $c2  install$green 4xfce GUI-OS? $re                   [y/n]: " ;
tput cuu1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; 
read -ep  "  $c2  install$green a better bash? $re                  [y/n]: " -i "n" "bbash"
read -ep  "  $c2  install$green custom-grub? $re                    [y/n]: " -i "n" "grub"
read -ep  "  $c2  install$green login-screen? $re                   [y/n]: " -i "n" "login"
read -ep  "  $c2  install$green webmin? $re                         [y/n]: " -i "n" "webmin"
read -ep  "  $c2  install$green openlitespeed? $re                  [y/n]: " -i "n" "ols"
read -ep  "  $c2  install$green cloudpanel-regular? $re             [y/n]: " -i "n" "cpr"
read -ep  "  $c2  install$green cloudpanel-cracked? $re             [y/n]: " -i "n" "cpc"
read -ep  "  $c2  install$green hestia-web-server? $re              [y/n]: " -i "n" "hestia"
read -ep  "  $c2  install$green guake? $re                          [y/n]: " -i "n" "guake"
read -ep  "  $c2  install$green 4xfce GUI-OS? $re                   [y/n]: " -i "n" "xfce"



echo -e "$purple ---------------------------------------------$re "
read -ep "  $c2 $yellow begin installation? $re         [y/n]: " -i "n" "continue";
if [ $continue == y ]; then echo -e "\n\n\t --$cyan OK$re -- \n\n";
## REMEMER TO CHANGE VAR-NAMES.
cd $inst;



################
## BBASH #######
################
##
## autosudo colorbash etc ...
if [ $bbash == y ]; then echo "  --  Making bash better... "; sleep 0.5; cd /;
##
## auto root for for admins
echo "%sudo ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/10-installer;
## Install greet screen
apt -y install fortune cowsay; ln /usr/games/fortune /bin/; ln /usr/games/cowsay /bin/; cd $inst;
## NANO - Improvements ...
echo "  --  NANO - Improvements ... "
mv /etc/nanorc $bufolder ; wget -O "/etc/nanorc" "https://github.com/12ants/00/raw/main/nanorc"; 
##
## COLORS-bash
# backup prev confing files
mv /etc/bash.bashrc $bufolder; # backup bashrc root
mv /home/$SUDO_USER/.bashrc $bufolder; # backup bashrc user
mv /root/.bashrc $bufolder.bashrc-root;

## fetching .bashrc-config-file from github
wget -O "/etc/bash.bashrc" $rootgit/etcbash.sh; ## for root
# wget -O "/home/$SUDO_USER/.bashrc" $rootgit/bash-upg.sh; ## for sudo user



## root
#echo 'PS1="\[\e[92;2;4m\]\$\[\e[0m\] [\[\e[95m\]$?\a\[\e[0;2m\].\[\e[90m\]\t\[\e[0m\]]\[\e[2m\].x.\[\e[0m\][\[\e[92;2m\]$(ipnet)\[\e[0m\]]\[\e[2m\].\[\e[0m\][\[\e[36;1;3;4;53m\]\u\[\e[0m\]]\[\e[2m\].\[\e[0m\][\[\e[93;2m\]\w\[\e[0m\]] >\[\e[2;4m\]_\[\e[0m\]"' >> /home/$SUDO_USER/.bashrc
# user
#echo 'PS1="\[\e[92;2;4m\]\$\[\e[0m\] [\[\e[95m\]$?\a\[\e[0;2m\].\[\e[90m\]\t\[\e[0m\]]\[\e[2m\].\[\e[0m\][\[\e[92;2m\]$(ipnet)\[\e[0m\]]\[\e[2m\].\[\e[0m\][\[\e[36;1;3;4;53m\]\u\[\e[0m\]]\[\e[2m\].\[\e[0m\][\[\e[93;2m\]\w\[\e[0m\]] >\[\e[2;4m\]_\[\e[0m\]"' >> /etc/bash.bashrc


##
## delete?
##
### - Append variable to system files ...
#echo "$ps1colors" >> /root/.bashrc; 
#echo "$ps1colors" >> /etc/profile; 
#echo "$ps1colors" >> /etc/bash.bashrc;
#echo "$ps1colors" >> /home/PS1_colors.sh; 
###
##
sleep .4; echo -e "\n\n\t$gray$c2 Task Complete ... \t [$green Done$re ]$gray$c2 \n\n "; sleep 1;
sleep .4; echo -e "$c2 $green    --  https://12ants.github.io/$re $c2$re"; sleep 1;
sleep .4; 
##
## - Done setting color to bash ...
## - Done setting color to bash ...

else echo "OK"; fi; cd $inst;
##
#######################
## BBASH - DONE #######
#######################
##
##
##
#######################
## GRUB ###############
#######################
##
if [ $grub == y ]; then echo "installing grub";
wget -O 12grub.sh $rootgit/grub.sh; bash 12grub.sh;
else echo "OK"; fi; cd $inst;
##
######################
## Grub - DONE #######
######################
##
##
#######################
## LOGIN - DONE #######
#######################
##
if [ $login == y ]; then echo "installing login-screen";
wget -O 12login.sh $rootgit/login.sh; bash 12login.sh;
else echo "OK"; fi; cd $inst;
##
#######################
## LGOIN - DONE #######
#######################

##
#######################
## WEBMIN - DONE ######
#######################
##
if [ $webmin == y ]; then echo "installing webmin";
wget https://download.webmin.com/devel/tarballs/webmin-current.tar.gz;
tar -xf webmin-current.tar.gz --strip-components=1; 
./setup.sh /usr/local/webmin;
else echo "OK"; fi; cd $inst;
##
#######################
## WEBMIN - DONE ######
#######################
##

##
#######################
## CLOUDPANEL #########
#######################
##
if [ $cpr == y ]; then echo "  -- installing cloudpanel.. ";
apt -y install curl ssh openssh-server openssl;
curl -sS https://installer.cloudpanel.io/ce/v2/install.sh -o install.sh; \
echo "3874fff99744cf3afe6f533013282e87c95640e128d1d3998666e2929dc12978 install.sh" | \
sha256sum -c && sudo bash install.sh;
apt update; apt -y upgrade;
read -ep "   -- System will now reboot... Run installer again to install other apps -- " -i "OK" "kkkkkk"
sleep 1; reboot;
else echo "OK"; fi; cd $inst;
## CP CUSTOM - BUILD // NEEDS WORK
if [ $cpc == y ]; then echo "installing cloudpanel";
wget -O 12cloudpanel.sh $rootgit/cloudpanel_ask.sh && bash 12cloudpanel.sh;
else echo "OK"; fi; cd $inst;
## CPC - Done //
##
#######################
## CLOUDPANEL - DONE ##
#######################
##
##
##





################
## GUAKE #######
################
##
if [ $guake == y ]; then echo "installing guake";
apt -y install guake;
else echo "OK"; fi; cd $inst;
## // GUAKE - Done
##
##
################
## XFCE  #######
################
##
if [ $xfce == y ]; then echo "installing xfce";
apt install -y -qq xfce4-session xfce4-goodies xfce4-panel alsa synaptic xinit luakit firefox guake    #  minimal desktop env
echo -e "\v\t Type [ startx ] to execute \v\v"
else echo "OK"; fi; cd $inst;
## remove install directories
rm $inst* -R
## // XFCE - Done
##
##
#####################
else echo "OK"; fi; cd $inst;
cd /home; echo -e "\n\n    --  goodluck have fun! \n\n"
####################
##
## end installer
## #!/bin/bash
echo -n -e "  --  Welcome $USER, today is: $(tput sgr0)"; date; echo;

sleep .1; echo -e "\n\n\t\t $purple ---------------------------------------------$re "
sleep .1; echo -e "\t\t $blue ---------------------------------------------$re "
sleep .1; echo -e "\t\t $green ---------------------------------------------$re "
sleep .1; echo -e "\t\t $red ---------------------------------------------$re "
sleep .1; echo -e "\t\t $re  ------- $green https://12ants.github.io/$re ------- $re "
sleep 1; echo -e " \t\t $red ---------------------------------------------$re "
sleep .1; echo -e " \t\t $blue ---------------------------------------------$re "
sleep .1; echo -e "\t\t $green ---------------------------------------------$re "
sleep .1; echo -e "\t\t $purple ---------------------------------------------$re "
## reboot countdown
echo -e "\n\n  Rebooting in 10 seconds ...\n"; sleep 1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; 
echo -e "\n\n  Rebooting in  9 seconds ...\n"; sleep 1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; 
echo -e "\n\n  Rebooting in  8 seconds ...\n"; sleep 1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; 
echo -e "\n\n  Rebooting in  7 seconds ...\n"; sleep 1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; 
echo -e "\n\n  Rebooting in  6 seconds ...\n"; sleep 1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; 
echo -e "\n\n  Rebooting in  5 seconds ...\n"; sleep 1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; 
echo -e "\n\n  Rebooting in  4 seconds ...\n"; sleep 1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; 
echo -e "\n\n  Rebooting in  3 seconds ...\n"; sleep 1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; 
echo -e "\n\n  Rebooting in  2 seconds ...\n"; sleep 1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; 
echo -e "\n\n  Rebooting in  1 seconds ...\n"; sleep 1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; 
echo -e "\n\n  Rebooting in  0 seconds ...\n"; sleep 1; tput cuu1; tput cuu1; tput cuu1; tput cuu1; 
echo bye; reboot;