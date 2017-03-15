#!/bin/bash
for (( i=1; i<=5; i++ ))
do
	echo "Zadejte svuj vek"
	read vek

	if [ $vek -le 14 ]; then
	echo "Jsi dítě."
	fi
	if [ $vek -ge 15 ] && [ $vek -lt 17 ]; then
	echo "Jsi mladistvý."
	fi
	if [ $vek -ge 18 ]; then
	echo "Jsi dospělý."
	fi
done
