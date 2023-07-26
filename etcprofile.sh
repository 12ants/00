
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
clear;
echo hello?; tput cup 1; tput setaf 7 bold; echo -e "\v\v\v\t";
/usr/games/fortune | /usr/games/cowsay -pn;
tput setaf 4; echo -e "
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
---------- $(tput setaf 7 dim) type [$(tput setaf 2)x$(tput setaf 7 dim)] or to start. [$(tput setaf 2)loginscreen$(tput setaf 7 dim)] for options or [$(tput setaf 2)info$(tput setaf 7 dim)] for hello ? $(tput setaf 4 bold) 
------------------------------------------------------------------------------------------------------------


";
tput sgr0;
alias x="startx"
alias loginscreen='
read -n1 -ep "  --  "$gray$dim"Choose default login screen, "$re"["$green"G"$re"]"$gray$dim"raphical or  "$re"["$blue"t"$re"]"$gray$dim"erminal?: " "lscreen";
echo -e "  --  $lscreen"
if [ "$lscreen" == "G/g" ];
then echo Graphical; systemctl set-default graphical.target;
else echo Terminal; systemctl set-default multi-user.target;
fi
'
