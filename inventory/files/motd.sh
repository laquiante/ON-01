#!/bin/bash
# inspired by: Ali A.

# Discovering and exracting
STADT=$HOSTNAME
CITY=${STADT: -2:1}
if [[ "$CITY" == 1 ]]; then DC='DC-01 Hamburg'
elif [[ "$CITY" == 2 ]]; then DC='DC-02 Wittdün'
else DC=N/A
fi
OS=$(grep -E '^VERSION=' /etc/os-release | cut -d "\"" -f 2)
UP=$(uptime -p | awk '{for(i=2;i<=NF;i++){printf "%s ", $i}}')
IPv4_mgmt=$(ip address show eth0 | grep global | awk '{print $2}')
IPv4_lo=$(ip address show lo | grep global | awk '{print $2}' | head -n 1)
KERNEL=$(uname -r)

# Clear
clear
# Banner
echo "
 ######  ##     ## ##     ## ##     ## ##       ##     ##  ######     ##       #### ##    ## ##     ## ##     ##
##    ## ##     ## ###   ### ##     ## ##       ##     ## ##    ##    ##        ##  ###   ## ##     ##  ##   ##
##       ##     ## #### #### ##     ## ##       ##     ## ##          ##        ##  ####  ## ##     ##   ## ##
##       ##     ## ## ### ## ##     ## ##       ##     ##  ######     ##        ##  ## ## ## ##     ##    ###
##       ##     ## ##     ## ##     ## ##       ##     ##       ##    ##        ##  ##  #### ##     ##   ## ##
##    ## ##     ## ##     ## ##     ## ##       ##     ## ##    ##    ##        ##  ##   ### ##     ##  ##   ##
 ######   #######  ##     ##  #######  ########  #######   ######     ######## #### ##    ##  #######  ##     ##



                                        #######    #####    #######   #######
                                       ##     ##  ##   ##  ##     ## ##     ##
                                              ## ##     ##        ##        ##
                                        #######  ##     ##  #######   #######
                                       ##        ##     ## ##               ##
                                       ##         ##   ##  ##        ##     ##
                                       #########   #####   #########  #######



"

echo -e "You are working now in: \e[0;32m" $DC" \e[0m"
echo -e "On device:              \e[0;32m" $HOSTNAME" \e[0m"
echo -e "Operating System:       \e[0;34m" $OS" \e[0m"
echo -e "Kernel:                 \e[0;34m" $KERNEL" \e[0m"
echo -e "Uptime:                 " $UP
echo -e "Managemnt via eth0:     " $IPv4_mgmt
echo -e "Loopback:               " $IPv4_lo

echo " "
echo " "


echo -e "╔═══════════════════════════════════════════════╗"
echo -e "║                                               ║"
echo -e "║        \\e[0;21mDC-01 Hamburg\\e[0m      \\e[0;21mDC-02 Wittdün\\e[0m       ║"
echo -e "║                                               ║"
echo -e "║                                               ║"
echo -ne "║ \\e[0;31mRACK-A\\e[0m "
for i in leaf11 spine13 spine23 leaf21; do
  if [[ $i == $HOSTNAME ]]; then
    echo -ne "\\e[0;41m\\e[1;33m[$i]\\e[0m "
  else
    echo -ne "[$i] "
  fi
done
echo -n " "
echo -e "║             "
echo -e "║                                               ║"
echo -ne "║ \\e[0;33mSP\\e[0m                "
for i in wan01 wan02; do
  if [[ $i == $HOSTNAME ]]; then
    echo -ne "\\e[0;41m\\e[1;33m[$i]\\e[0m "
  else
    echo -ne "[$i] "
  fi
done
echo -n " "
echo -e "           ║             "



echo -e "║                                               ║"
echo -ne "║ \\e[0;31mRACK-B\\e[0m "
for i in leaf12 spine14 spine24 leaf22; do
  if [[ $i == $HOSTNAME ]]; then
    echo -ne "\\e[0;41m\\e[1;33m[$i]\\e[0m "
  else
    echo -ne "[$i] "
  fi
done
echo -n " "
echo -e "║             "
echo -e "║                                               ║"
echo -e "║                                               ║"
echo -e "╚═══════════════════════════════════════════════╝"
echo ""
