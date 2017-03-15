#!/bin/bash
tac /etc/passwd | head -n 28 | while read radek
do
	uzivatel=`echo $radek | awk  -F ":" '{print $1}'`
	echo "NAZDAR!" | write $uzivatel

done
