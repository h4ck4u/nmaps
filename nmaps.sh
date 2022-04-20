#!/bin/bash

ports=$(nmap -p- -sS --min-rate 5000 --open -n $1 | grep  '^[0-9]' | cut -d '/' -f 1 | xargs | tr ' ' ',')
nmap -sCV -p$ports $1 -oN Targeted
