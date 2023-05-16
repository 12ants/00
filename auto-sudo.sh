## auto root for for admins
echo "%sudo ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/10-installer;


## ROOT AUTOCOMPLETE
echo "if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

" >> /root/.bashrc;

echo '
# ALIAS
alias "ip-network"="hostname -I"
alias "ip-public"="dig +short myip.opendns.com @resolver1.opendns.com"
alias "ip-ports"="lsof -i -P -n"

#### USERNAME ####
##################
PS1="\[\e[0;38;5;23m\]$? \[\e[0;2m\]/ \[\e[0;38;5;30m\]$(ip route get 1.1.1.1 | awk -F"src " '"'"'NR==1{split($2,a," ");print a[1]}'"'"') \[\e[0;2m\]/ \[\e[0;38;5;31m\]\u \[\e[0;2m\]/ \[\e[0;38;5;36m\]\w \[\e[0m\]> \[\e[0m\]"'
>> ~/.bash_aliases;



echo '
# ALIAS
alias "ip-network"="hostname -I"
alias "ip-public"="dig +short myip.opendns.com @resolver1.opendns.com"
alias "ip-ports"="lsof -i -P -n"

#### USERNAME ####
##################
PS1="\[\e[0;38;5;23m\]$? \[\e[0;2m\]/ \[\e[0;38;5;30m\]$(ip route get 1.1.1.1 | awk -F"src " '"'"'NR==1{split($2,a," ");print a[1]}'"'"') \[\e[0;2m\]/ \[\e[0;38;5;31m\]\u \[\e[0;2m\]/ \[\e[0;38;5;36m\]\w \[\e[0m\]> \[\e[0m\]"'
>> /root/.bash_aliases;
