#!/bin/bash

function ctrl_c(){
 echo -e "\n\n [!]Exiting...\n"
 tput cnorm; exit 1
}

trap ctrl_c INT

declare -r ip_address="$1"

tput civis
if ["$(echo $ip_address | grep -oP "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}")"]; then
  ports=$(nmap -p- -sS --min-rate 5000 --open -n $1 | grep  '^[0-9]' | cut -d '/' -f 1 | xargs | tr ' ' ',')
  nmap -sCV -p$ports $1 -oN Targeted
fi

tput cnorm
