#/bin/bash
if [ $UID != 0 ]; then echo -e " \n\n\t This script must be run as root... try command: [ sudo -s ] \n\n " 1>&2; exit 1; fi; ## ROOT-CHECK

alias "ipnet"="hostname -I | head -c 13"
alias "ippublic"="dig +short myip.opendns.com @resolver1.opendns.com"
alias "ipports"="lsof -i -P -n"
tput setaf 11
ipnet
ippublic
ipports
tput setaf 15
touch ~/.bash_aliases;
touch /.bash_aliases;

#### USER
echo '
## ALIAS
alias "ipnet"="hostname -I | head -c 13"
alias "ippublic"="dig +short myip.opendns.com @resolver1.opendns.com"
alias "ipports"="lsof -i -P -n"
## USERNAME
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

## auto root for for admins
echo "%sudo ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/10-installer;


## ROOT AUTOCOMPLETE
echo "if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
" >> /root/.bashrc;



#### TMP
echo '
## ALIAS
alias "ipnet"="hostname -I | head -c 13"
alias "ippublic"="dig +short myip.opendns.com @resolver1.opendns.com"
alias "ipports"="lsof -i -P -n"
## USERNAME
PS1="\[\e[0;38;5;23m\]$? \[\e[0;2m\]/ \[\e[0;38;5;30m\]$(ipnet) \[\e[0;2m\]/ \[\e[0;38;5;31m\]\u \[\e[0;2m\]/ \[\e[0;38;5;36m\]\w \[\e[0m\]> \[\e[0m\]"'
>> /.bash_aliases;
