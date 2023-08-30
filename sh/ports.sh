

## PORTS

echo 'alias "portnets"="echo -e "\n\n   $cyan-$re Open ports on local network"$cyan" -"$re" \n"; echo -e " -- -- -- -- -- -- -- $(ports;  echo " -- -- -- -- -- -- --")"|column -tLo "$(tput sgr0)|  " -tLo "  $(tput sgr0)||   " -H 1,2,3,4,8; echo -e "\n\n"" ' >> /etc/bash.bashrc

echo 'alias "ports"="echo -e " $(tput smso) "; ss -rnpf inet" ' >> /etc/bash.bashrc
