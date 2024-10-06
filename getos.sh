#!/bin/bash

# Author: Col0rbl1nd.

# This script is used to get the TTL of a device.
# the TTL provides you with the OS.
# if the TTL is less or equal than 64  is Linux
# if the TTL is less or equal than 128 is Windows
# if the TTL is bigger than 128 or equal than 255 is Solaris/Atx 

# No colors, no hacking! :)
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"


# This is the main Function.
function getOS(){
    ip=$1
    # With ping I can take the TTL.
    ttl_number=$(ping -c 1 $ip 2>/dev/null | awk -F "ttl=" '/ttl=/{print $2}' | awk '{print $1}')
    
    # When the TTL is empty.
    if [ -z "$ttl_number" ]; then
    	echo -e "[${RED}!${ENDCOLOR}] Error: ${RED}$ip${ENDCOLOR} did not respond."
	return 
    fi

    # Linux
    if [ "$ttl_number" -le "64" ]; then
       echo -e "[${GREEN}*${ENDCOLOR}] The target ${GREEN}$ip${ENDCOLOR} is ${GREEN}Linux${ENDCOLOR}."

    # Windows
    elif [ "$ttl_number" -le "128" ]; then
       echo -e "[${GREEN}*${ENDCOLOR}] The target ${GREEN}$ip${ENDCOLOR} is ${GREEN}Windows${ENDCOLOR}."
    
   # Other (IoT,etc)
    elif [ "$ttl_number" -le "255"  ]; then
       echo -e "[${GREEN}*${ENDCOLOR}] The target ${GREEN}$ip${ENDCOLOR} is ${GREEN}Solaris/Atx${ENDCOLOR}."
    
    else
       echo "[${RED}!${ENDCOLOR}] Error: Unknown TTL value for $ip."

    fi
};


getOS $1
