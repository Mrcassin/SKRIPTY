#!/bin/bash
echo "Zadejte svuj vek:"
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

echo "Mam se skvěle."
  

