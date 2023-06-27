#/bin/bash
echo "--  Installing Tard-Grub 2.0..."

mkdir -p -m 775 /boot/grub/ ; 
cd /boot/grub/ ;
# wget https://github.com/12ants/ss/raw/main/tard.jpg ;
wget -O tard.jpg https://github.com/12ants/00/raw/main/img/tard2.jpg;
rm /etc/default/grub.d/*;
echo '
GRUB_BACKGROUND="/boot/grub/tard.jpg"
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true
GRUB_TIMEOUT_STYLE=menu
GRUB_TIMEOUT=6
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_DISABLE_OS_PROBER=false
GRUB_HIDDEN_TIMEOUT=0
GRUB_CMDLINE_LINUX="" 
GRUB_CMDLINE_LINUX_DEFAULT="--" 

' > /etc/default/grub; 

update-grub ; 
echo -e "\v\t -- GRUB INSTALLED SUCCESSFULLY \v"
echo "  ####################################
  #### -All done!--###################
  ####################################



"
