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

############################
#### -- LOGIN SCREEN -- ####
#### replace "/etc/profile" - system-wide .profile file for the Bourne shell (sh(1))
mv /etc/profile /etc/profile~bu
wget -O "/etc/profile" $rootgit/etcprofile.sh;

##

##

echo "
        hello traveler etc motd whaa
sleep 1
" >> /etc/motd 
/etc/init.d/ssh restart 

