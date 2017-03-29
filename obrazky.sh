#!/bin/bash
function hlavniMenu {
	clear
	echo "******************************"
	echo "******** UPRAVA FOTEK ********"
	echo "******************************"
	echo "****  Zmena formatu    1) ****"
	echo "****  Zmena kvality    2) ****"
	echo "****  Zmena velikosti  3) ****"
	echo "****  Otoceni          4) ****"
	echo "****  Efekty           5) ****"
	echo "****  Konec            0) ****"
	echo "******************************"
}

function SorSMenu {
	clear
	echo "******************************"
	echo "****    Chcete upravit    ****"
	echo "****  slozku nebo soubor  ****"
	echo "******************************"
	echo "****   Slozku          1) ****"
	echo "****   Soubor          2) ****"
	echo "******************************"
}

function cestaMenu {
	clear
	echo "******************************"
	echo "****    Zadejte cestu     ****"
	echo "****      k vasemu/i      ****"
	echo "****    souboru/slozce    ****"
	echo "******************************"
	echo "Zadejte cestu: "
}

function formatMenu {
	clear
	echo "******************************"
	echo "****    Zmena formatu     ****"
	echo "******************************"
	echo "**** JPG --> PNG       1) ****"
	echo "**** PNG --> JPG       2) ****"
	echo "**** Zpet              0) ****"
	echo "******************************"
}

function kvalitaMenu {
	clear
	echo "******************************"
	echo "****    Zmena kvality     ****"
	echo "******************************"
	echo "**** Zadejte kvalitu v %  ****"
	echo "**** Zpet              0) ****"
	echo "******************************"
}

function velikostMenu {
	clear
	echo "******************************"
	echo "****    Zmena velikosti   ****"
	echo "******************************"
	echo "****  Zadejte rozliseni   ****"
	echo "****   Napriklad: 1920    ****"
	echo "****              1080    ****"
	echo "**** Zpet            0)   ****"
	echo "******************************"
}

function otoceniMenu {
	clear
	echo "******************************"
	echo "****        Otoceni       ****"
	echo "******************************"
	echo "**** Zadejte uhel otoceni ****"
	echo "**** Zpet              0) ****"
	echo "******************************"
}

function efektyMenu {
	clear
	echo "******************************"
	echo "****        Efekty        ****"
	echo "******************************"
	echo "**** Implode Efekt     1) ****"
	echo "**** Charcoal Efekt    2) ****"
	echo "**** Zpet              0) ****"
	echo "******************************"
}

function choice {
	while :; do
		echo $3
		read nChoice
		if [[ "$nChoice" -ge "$1" && "$nChoice" -le "$2" ]]; then
			return "$nChoice"
		else
			echo "Nezadal jste spravnou volbu, zadejte znovu."
		fi
	done
}

function getPath {
	SorSMenu
	choice 1 2 "Napiste vasi volbu: "
	DoF=$nChoice
	cestaMenu
	read path
	return $DoF
	return $path
}

function stop {
	echo "[ Zmacknete jakekoukoliv klavesu pro pokracovani. ]"
	read 
}

function shortProcces {
	getPath
	if [[ "$DoF" == 2 ]]; then
		pathShort=`echo $path | awk -F "." '{print $1}'`
		pathType=`echo $path | awk -F "." '{print $2}'`
		echo "Pockejte prosim..."
		convert $path "-"$2 $1 $pathShort"-"$2"_"$1"."$pathType
		echo "Hotovo!"
		stop
	else
		cd $path
		for file in *.*; do
			path=$file
			pathShort=`echo $path | awk -F "." '{print $1}'`
			pathType=`echo $path | awk -F "." '{print $2}'`
			echo "Proccesing file: $path" 
			convert $path "-"$2 $1 $pathShort"-"$2"_"$1"."$pathType
		done
		echo "Hotovo!"
		stop	
	fi
}

function longProcces {
	choice 0 2 "Napiste vasi volbu: "
	var=$nChoice
	getPath
	if [[ "$var" == '1' ]]; then
		if [[ "$DoF" == '2' ]]; then
			pathShort=`echo $path | awk -F "." '{print $1}'`
			pathType=`echo $path | awk -F "." '{print $2}'`
			echo "Pockejte prosim..."
			if [[ "$1" == '1' ]]; then
				convert $path $pathShort".png"
			else
				convert $path -implode 1 $pathShort"-imploded."$pathType
			fi
			echo "Hotovo!"
			stop			
		else
			cd $path
			for file in $2; do
				path=$file
				pathShort=`echo $path | awk -F "." '{print $1}'`
				pathType=`echo $path | awk -F "." '{print $2}'`
				echo "Proccesing file $path...."
				if [[ "$1" == '1' ]]; then
					convert $path $pathShort".png"
				else
					convert $path -implode 1 $pathShort"-imploded."$pathType
				fi
			done
			echo "Hotovo!"
			stop
		fi
	else
		if [[ "$DoF" == '2' ]]; then
			pathShort=`echo $path | awk -F "." '{print $1}'`
			pathType=`echo $path | awk -F "." '{print $2}'`
			echo "Pockejte prosim..."
			if [[ "$1" == '1' ]]; then
				convert $path $pathShort".jpg"
			else
				convert $path -charcoal 2 $pathShort"-charcoal."$pathType
			fi
			echo "Hotovo!"
			stop			
		else
			cd $path
			for file in $3; do
				path=$file
				pathShort=`echo $path | awk -F "." '{print $1}'`
				pathType=`echo $path | awk -F "." '{print $2}'`
				echo "Proccesing file $path...."
				if [[ "$1" == '1' ]]; then
					convert $path $pathShort".jpg"
				else
					convert $path -charcoal 2 $pathShort"-charcoal."$pathType
				fi
			done
			echo "Hotovo!"
			stop
		fi
	fi
}

while :; do
	clear
	hlavniMenu
	choice 0 5 "Napiste vasi volbu: "
	case "$nChoice" in
		1)
			formatMenu
			longProcces '1' "*.jpg" "*.png"
			;;
		2)
			kvalitaMenu
			choice 0 100 "Zadejte kvalitu v % (1 - 100): "
			var=$nChoice
			shortProcces $var "quality"	
			;;
		3)
			velikostMenu
			choice 0 100000 "Zadejte sirku: "
			width=$nChoice
			if [[ "$nChoice" -gt '0' ]]; then 
				choice 0 100000 "Zadejte vysku: "
				height=$nChoice
				var=`echo $width"x"$height`
				shortProcces $var "resize"
			fi
			;;
		4)
			otoceniMenu
			choice -360 360 "Zadejte uhel otoceni: "
			var=$nChoice
			shortProcces $var "rotate"
			;;
		5)
			efektyMenu
			longProcces '2' "*.*" "*.*"
			;;
		0)
			clear
			exit
			;;
		*)
			echo "Nezadal jste spravnou volbu, zadejte znovu."
			;;
	esac
done
