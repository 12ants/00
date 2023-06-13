alias "u1"="tput cuu1; "
alias "u2"="tput cuu1; tput cuu1; "
alias "u3"="tput cuu1; tput cuu1; tput cuu1; "
alias "u4"="tput cuu1; tput cuu1; tput cuu1; tput cuu1; "
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
. /etc/bash_completion
fi
alias "ipnet"="hostname -I | head -c 13";
alias "ippublic"="dig +short myip.opendns.com @resolver1.opendns.com";
alias "ipports"="lsof -i -P -n";
alias "ip"="echo -e \"" \v\t-- Public-ip: $(ippublic) --\n\t - - - - - - - - - - - - - - -\n\t-- Network-ip: $(ipnet) --\v\"""
ip; /usr/games/fortune; 
PS1="\[^[[0;38;5;23m\]$? \[^[[0;2m\]/ \[^[[0;38;5;30m\]$(ipnet) \[^[[0;2m\]/ \[^[[0;38;5;31m\]\u \[^[[0;2m\]/ \[^[[0;38;5;36m\]\w \[^[[0m\]> \[^[[0m\]"
