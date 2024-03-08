#!/bin/bash

IN="$1"
[ ! -f "$IN" ] && exit 1
[ ! -r "$IN" ] && exit 1
CYFRY=0
LITERY=0
SUMA_LICZB=0
IFS=$'\n'
for L in $(cat "$IN") ; do
	IFS=$' \t\n'
	for E in $(echo "$L") ; do
		if [ $(echo "$E" | egrep "^[0-9]+$") ] ; then
			let SUMA_LICZB+="$E"
			let CYFRY+="$(echo -n "$E" | wc -c)"
		else
			let LITERY+="$(echo -n "$E" | wc -c)"
		fi 
	done
done

echo "Plik $IN zawiera $CYFRY cyfr oraz $LITERY liter."
echo "Suma wszysctkich liczb wynosi $SUMA_LICZB" 
