#!/bin/bash
echo "Podaj numer argumentu: "
read NR
I=1
while [ "$I" -le "$NR" ] ; do
	if [ "$I" -eq "$NR" ] ; then
		echo "$1"
		exit 0
	else
		shift
		let I++
	fi
done 

exit 0
