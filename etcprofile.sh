
# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).

if [ "${PS1-}" ]; then
  if [ "${BASH-}" ] && [ "$BASH" != "/bin/sh" ]; then
    # The file bash.bashrc already sets the default PS1.
    # PS1="\h:\w\$ "
    if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
    fi
  else
    if [ "$(id -u)" -eq 0 ]; then
      PS1="# "
    else
      PS1="$ "
    fi
  fi
fi

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

#########################
## -- CUSTOM LINUX --  ##
#########################
##
## --login-screen-- ##
echo hello?; tput cup 1; tput setaf 7 bold; echo -e "\v\v\v\t";
/usr/games/fortune | /usr/games/cowsay -pn;
tput setaf 4; read -n1 -ep "
------------------------------------
------------------------------------
---------- $(tput setaf 7 bold) Start windows ? $(tput setaf 7)[$(tput setaf 2)Y$(tput setaf 7)/$(tput setaf 1)n$(tput setaf 7)]$(tput setaf 7 bold) " yn;
if [ "$yn" != "${yn#[Nn]}" ]; then
echo "${re} nope ";echo -e ;
else ###### ---- [YES] ----- ######
echo OK
startx
fi

alias loginscreen=
read -n1 -ep "  --  "$gray$dim"Choose default login screen, "$re"["$green"G"$re"]"$gray$dim"raphical or  "$re"["$blue"t"$re"]"$gray$dim"erminal?: " "lscreen";
echo -e "  --  $lscreen"
if [ "$lscreen" != "${lscreen#[Gg]}" ];
then echo Graphical; systemctl set-default graphical.target;
else echo Terminal; systemctl set-default multi-user.target;
fi

loginscreen