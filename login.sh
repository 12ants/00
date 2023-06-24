#!/bin/bash
## LOGIN TWEAKS
##
sudo apt install -y ssh fortune cowsay
## console login default
systemctl set-default multi-user.target
## gui def
systemctl set-default graphical.target


read -n1 -ep "  --  Choose default login screen [t]erminal or [g]raphical?: " "loginscreen"
## Message before login
if 
## echo "Hello login" >> /etc/issue /etc/ssh/sshd-banner
echo "Banner /etc/ssh/sshd-banner" >> /etc/ssh/sshd-config
echo '

  Welcome to 12ants.com -- today is \d \t @ \n

  _____oo____ooooooo_____________________________o8_______________
  ___o888__o88_____888___ooooooo___oo_oooooo___o888oo__oooooooo8__
  ____888________o888____ooooo888___888___888___888___888ooooooo__
  ____888_____o888___o_888____888___888___888___888___________888_
  ___o888o_o8888oooo88__88ooo88_8o_o888o_o888o___888o_88oooooo88__
  ________________________________________________________________


' > /etc/issue


## Message after login


############################
#### -- LOGIN SCREEN -- ####
#### replace "/etc/profile" - system-wide .profile file for the Bourne shell (sh(1))
mv /etc/profile /etc/profile~bu
echo '
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
' > /etc/profile

echo "
        hello traveler etc motd whaa

" > /etc/motd 

/etc/init.d/ssh restart 

