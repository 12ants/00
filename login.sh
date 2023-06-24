#!/bin/bash
## LOGIN TWEAKS
##
sudo apt install -y ssh fortune cowsay
## console login default
#systemctl set-default multi-user.target
## gui def
#systemctl set-default graphical.target

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
echo 'alias loginscreen='read -n1 -ep "  --  Choose default login screen, [G]raphical or  [t]erminal?: " "yn";
if [ "$lscreen" != "${lscreen#[Gg]}" ];
then echo Graphical; systemctl set-default graphical.target;
else echo Terminal; systemctl set-default multi-user.target;
fi
''
loginscreen
>> /etc/profile
############################
#### -- LOGIN SCREEN -- ####
#### replace "/etc/profile" - system-wide .profile file for the Bourne shell (sh(1))
mv /etc/profile /etc/profile~bu
echo '

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

