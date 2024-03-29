


#!/bin/bash
clear
read -p "    ${pink}--${normal}  Install or update the web-server? [Y/n] " yn;if [ "$yn" != "${yn#[Nn]}" ];then echo "    --  No - OK";else
echo -e "    ${purple}--${normal}  YES - ${green}OK${gray} - Hold on ${normal}updating..."
#### UPDATES SILENTLY ##################
apt update -qq > out.log 2>/dev/null;
########################################
sleep 0.1;echo ${darkgray}
sleep 0.1;echo
apt install -qq -y apache2 ghostscript libapache2-mod-php curl lynx mariadb-server tar openssl ;
apt install -qq -y php php-gd php-memcache php-soap php-tidy php-cli php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql php-xml php-zip ;

fi

cd /var
sleep 0.1;echo "    ${pink}--${normal} downloading-wordpress -----"
wget -nc -b "http://wordpress.org/latest.tar.gz">null



##################################################################
###### Ask for URL (if none, generate one) #######################
##################################################################
read -p "    ${pink}--${normal} ${blue}Base url: like: -- ${normal}myaddress.net -- ${blue}(leave as is if unsure):${white} " userurl ;
if [[ -z "$userurl" ]]; then
userurl="wordpress$(date +%d%m%y)" ;
fi
read -p "    ${yellow}--${normal} ${blue}New directory: like: ${pink}--${normal} ${white}new-wp-site ${pink}--${normal} ${blue}(leave empty if unsure):${white} " userdir
install_dir="/var/www/${userurl}${userdir}"
sleep 0.1;echo
sleep 0.1;echo
read -p "    ${red}--${normal}  Change site directory? [y/N] " yn;if [ "$yn" != "${yn#[Yy]}" ];then echo "    ${pink}--${normal}  Yes - OK";
sleep 0.1;echo
sleep 0.1;echo
read -p "    ${blue}--${normal}  New directory? (default: $install_dir): " install_dir
install_dir="${install_dir}/${userurl}${userdir}"
sleep 0.1;echo
echo "    ${pink}--${normal}  OK"
sleep 0.1;echo
else
echo "    ${white}--${normal}  NO - OK";
fi

sleep 0.1;echo " ${white} "
mv -n ${install_dir} ${install_dir}_backup 2>/dev/null;
sleep 0.2;echo "    ${pink}--${normal} Creating folders... "
sleep 0.2;echo "    ${pink}--${normal} OK                  "
sleep 0.2;echo "    ${pink}--${normal} Web directory: ${install_dir}"
sleep 0.2;echo "    ${pink}--${normal} Checking apache2..."
mkdir -p -m 0775 ${install_dir} ;
sleep 0.1 ;
chown www-data: ${install_dir} -R ;
sleep 0.2;echo "    ${pink}--${normal} OK: Apache2 directory is ready!"
sleep 0.1;echo " ${purple} "
sleep 0.2;echo "    -------------------------"

cd $install_dir;
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 3650 -nodes -subj "/CN=$userurl";
chmod 775 ./*.pem;

echo "
<VirtualHost *:443>
ServerName ${userurl}
ServerAlias ${userurl}
DocumentRoot ${install_dir}
SSLEngine on

	
	SSLCertificateKeyFile   key.pem
	SSLCertificateFile      cert.pem


		<FilesMatch "\.(?:cgi|shtml|phtml|php)$">
		SSLOptions +StdEnvVars
	</FilesMatch>
	<Directory /usr/lib/cgi-bin>
		SSLOptions +StdEnvVars
	</Directory>
	
<Directory ${install_dir}>
Options FollowSymLinks
AllowOverride all
DirectoryIndex index.php
Require all granted
</Directory>
<Directory ${install_dir}/wp-content>
AllowOverride all
Options FollowSymLinks
Require all granted
</Directory>
</VirtualHost>

" > /etc/apache2/sites-available/${userurl}.conf;

echo 
a2ensite ${userurl}
a2enmod rewrite 
a2enmod headers
a2enmod ssl
a2dissite 000-default
service apache2 restart;
service mariadb restart;
echo

db_name="wp`date +%N`";
sleep 0.2;echo ;
db_user="`date +%B%N`";
sleep 0.2;echo ;
db_password=`date|md5sum|cut -c 1-14`;





echo "
    $green ###################################### ${normal}
    $darkblue db_name:$gray $db_name            
    $darkblue db_user:$gray $db_user            
    $darkblue db_password:$gray $db_password    
    $green ###################################### ${normal}
"





mysql -u root <<MYSQL_SCRIPT
CREATE DATABASE $db_name;
CREATE USER '$db_user'@'localhost' IDENTIFIED BY '$db_password';
GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT


systemctl restart mysql;
systemctl restart mariadb;
systemctl restart apache2;
service apache2 restart;
service mariadb restart;









mv /var/latest.tar.gz ${install_dir}/latest.tar.gz
cd ${install_dir}
chown www-data: ./ -R;chmod 775 ./ -R
echo ; sleep 0.1 ; 
tar -xzf latest.tar.gz --overwrite --strip-components=1;
echo ; sleep 0.2 ;
chown www-data: ./ -R
chmod 775 ./ -R



echo "$green             ###################################################"
echo "$green             ####${normal} Creating WP-config and set DB credentials${green} #### "
mv ${install_dir}/wp-config-sample.php ${install_dir}/wp-config.php ; sleep 0.2 ;
sed -i "s/database_name_here/$db_name/g" ${install_dir}/wp-config.php ; sleep 0.2 ;
sed -i "s/username_here/$db_user/g" ${install_dir}/wp-config.php ; sleep 0.2 ;
sed -i "s/password_here/$db_password/g" ${install_dir}/wp-config.php ; sleep 0.2 ;
echo "$green             ###################################################${normal}"
mv -n ${install_dir}/index.html ${install_dir}/index.html_backup 2>/dev/null;

##### Set WP Salts
grep -A50 'table_prefix' $install_dir/wp-config.php > /tmp/wp-tmp-config
sed -i '/**#@/,/$p/d' $install_dir/wp-config.php
lynx --dump -width 200 https://api.wordpress.org/secret-key/1.1/salt/ >> $install_dir/wp-config.php
cat /tmp/wp-tmp-config >> $install_dir/wp-config.php && rm /tmp/wp-tmp-config -f
#############

echo "
@ini_set( 'upload_max_filesize' , '2222M' );
@ini_set( 'post_max_size', '2222M');
@ini_set( 'memory_limit', '556M' );
@ini_set( 'max_execution_time', '300' );
@ini_set( 'max_input_time', '300' );
" >> $install_dir/wp-config.php

service apache2 restart
echo     "      It's -> OK"
chown www-data: $install_dir -v
chmod 775 $install_dir -v


echo "    "
echo >> ~/.$userurl-$userdir-LOGIN.txt MYSQL --- db-name-db-user:  $db_name  ------  db-pw:  $db_password  -----

tput setaf 2
echo " --------------------------------------------------------"
echo " -- Database credentials saved in: ----------------------"
echo " -- /homedirectory/.$userurl-$userdir-LOGIN.txt (Hidden folder).--"
sleep 0.1
echo " --------------------------------------------------------"
sleep 0.1
systemctl restart apache2
echo NETWORK-IP
hostname -I
echo PUBLIC-IP
dig +short myip.opendns.com @resolver1.opendns.com
echo enjoy
