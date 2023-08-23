


#!/bin/bash
####
#### /etc/bash.bashrc
#### appendix for windows bash
####
####

export bold=$(tput bold) dim=$(tput dim) so=$(tput smso) noso=$(tput rmso) rev=$(tput rev) re=$(tput sgr0) normal=$(tput sgr0) \
redb=$(tput setab 1) greenb=$(tput setab 2) yellowb=$(tput setab 3) blueb=$(tput setab 4) purpleb=$(tput setab 5) cyanb=$(tput setab 6) \
grayb=$(tput setab 7) red=$(tput setaf 1) green=$(tput setaf 2) yellow=$(tput setaf 3) blue=$(tput setaf 4) purple=$(tput setaf 5) \
cyan=$(tput setaf 6) gray=$(tput setaf 7) white=$(tput setaf 7 bold) pink=$(tput setaf 5 bold) darkblue=$(tput setab 5 bold) blink=$(tput blink) \
left2=$(tput cub 2) up1=$(tput cuu1) c75=$(echo "  ---------------------------------------------------------------------------"); clear; echo ; c2="$cyan --$re";

####

alias "00_update_bash"='
read -ep "  -- url:" -i "https://github.com/12ants/00/raw/main" rootgit
mv /etc/bash.bashrc /etc/bash.bashrc_bu ; 
mv /home/$SUDO_USER/.bashrc /home/$SUDO_USER/.bashrc_bu ; 
mv /root/.bashrc /root/.bashrc_bu ; 
wget -O "/etc/bash.bashrc" $rootgit/etcbash.sh;
'
alias "00_update_all"="wget -O "update.sh" 12ants.github.io && bash "update.sh""
alias "2222"="wget -O "update.sh" 12ants.github.io && bash "update.sh""
alias "oooo"="tput setaf 7 dim; fortune; tput sgr0;"
alias "rot"="sudo -s"
alias "iphome"="touch ip_network; hostname -i>ip_network 2>/dev/null ; hostname -I>>ip_network 2>/dev/null ; tail -c15 ip_network; "
alias "ipnet"="hostname -I | head -c 13";
alias "ippub"="curl -s ifconfig.me 2>/dev/null ";
alias "ipports"="sudo lsof -i -P -n";
#ip-alias
alias "ip"='echo ;
echo " $(tput setaf 6) ------$(tput setaf 2) Public IP: $(tput sgr0)$(ippub)$(tput setaf 6)";
echo " $(tput setaf 6) ---------------------------------- " ;
echo " $(tput setaf 6) ------$(tput setaf 4) Network IP: $(tput sgr0)$(iphome)$(tput setaf 6)"; echo; '
#/ip-alias
#alias-greet
alias "greet"='echo -n -e "  $(tput setaf 6)--$re Welcome back $darkblue $USER, $re today is:$blue "; date; echo;'
#/alias-greet
greet
oooo
ip 
PS1="\[\e[92;2;4m\]\$\[\e[0m\] [\[\e[95m\]$?\a\[\e[0;2m\].\[\e[90m\]\t\[\e[0m\]]\[\e[2m\].\[\e[0m\][\[\e[92;2m\]$(iphome)\[\e[0m\]]\[\e[2m\].\[\e[0m\][\[\e[36;1;3;4;53m\]\u\[\e[0m\]]\[\e[2m\].\[\e[0m\][\[\e[93;2m\]\w\[\e[0m\]] >\[\e[2;4m\]_\[\e[0m\]
"
