#!/bin/bash
ip=`ifconfig | grep "inet adr" | awk -F ":"  '{print $2}' ` 
ip=`echo $ip | awk -F " "  '{print $1}' `
echo "Moje IP: "$ip

rx=`ifconfig | grep  Přijato | awk -F "(" '{print $2}'`
rx=`echo $rx | awk -F ")" '{print $1}'`
echo "Přijato: "$rx

tx=`ifconfig | grep Odesláno | awk -F "(" '{print $3}'`
tx=`echo $tx | awk -F ")" '{print $1}'`
echo "Odesláno: "$tx

