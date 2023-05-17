#!/bin/bash
alias "ipnet"="tput setaf 1; hostname -I | head -c 13; tput sgr0; echo;"
alias "ippublic"="tput setaf 2; dig +short myip.opendns.com @resolver1.opendns.com; tput sgr0;"
alias "ipports"="tput setaf 6; lsof -i -P -n; tput sgr0;"
sleep 1;
echo -e "  -- Open ports:"
ipports
echo -e "  -- Network IP:"; ipnet; echo -e "  -- Network IP:"; ippublic;
touch ~/.bash_aliases;
touch /root/.bash_aliases;
#### USER
echo '
## ALIAS
alias "ipnet"="hostname -I | head -c 13"
alias "ippublic"="dig +short myip.opendns.com @resolver1.opendns.com"
alias "ipports"="lsof -i -P -n"
## USERNAME 8888
PS1="\[\e[0;38;5;23m\]$? \[\e[0;2m\]/ \[\e[0;38;5;30m\]$(ipnet) \[\e[0;2m\]/ \[\e[0;38;5;31m\]\u \[\e[0;2m\]/ \[\e[0;38;5;36m\]\w \[\e[0m\]> \[\e[0m\]"'
>> ~/.bash_aliases;
################
#### ROOT
echo '
## ALIAS
alias "ipnet"="hostname -I | head -c 13"
alias "ippublic"="dig +short myip.opendns.com @resolver1.opendns.com"
alias "ipports"="lsof -i -P -n"
## USERNAME
PS1="\[\e[0;38;5;23m\]$? \[\e[0;2m\]/ \[\e[0;38;5;30m\]$(ipnet) \[\e[0;2m\]/ \[\e[0;38;5;31m\]\u \[\e[0;2m\]/ \[\e[0;38;5;36m\]\w \[\e[0m\]> \[\e[0m\]"'
>> /root/.bash_aliases;
## same mmmmmmmmmmmmmmmmmmmmmm
echo '
## ALIAS
alias "ipnet"="hostname -I | head -c 13"
alias "ippublic"="dig +short myip.opendns.com @resolver1.opendns.com"
alias "ipports"="lsof -i -P -n"
## USERNAME
PS1="\[\e[0;38;5;23m\]$? \[\e[0;2m\]/ \[\e[0;38;5;30m\]$(ipnet) \[\e[0;2m\]/ \[\e[0;38;5;31m\]\u \[\e[0;2m\]/ \[\e[0;38;5;36m\]\w \[\e[0m\]> \[\e[0m\]"'
>> /root/.bashrc;

## auto root for for admins
echo "%sudo ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/10-installer;
## ROOT AUTOCOMPLETE
echo "if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
" >> /root/.bashrc;
echo " HELLO"
