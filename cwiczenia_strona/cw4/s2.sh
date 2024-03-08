#!/bin/bash

#IFS=$' \t\n'
IFS=$'\n'
#for each
#for E in "Ala ma kota" ; do
for E in $(ls) ; do
	if [ -f "$E" ] && [ -r "$E" ] ; then
		echo "Liczba znaków w pliku: $(cat $E | wc -c) -> $E"
		for L in $(cat "$E") ; do
			echo "Liczba znaków w linii: $(echo -n $L | wc -c) -> $L"
		done
	fi
 	echo "Liczba znaków w nazwie: $(echo -n $E | wc -c) -> $E"
done

exit 0
#while  - z poleceniem
while read L ; do
	echo "Liczba znaków: $(echo -n $L | wc -c) -> $L"
done < "$1"  > "$2"


exit 0
#for numeryczny - suma ciagu arytmetycznego
SUMA=0
N=10
I=0
T=""
for((I=0 ; $I<=$N  ; I++)) ; do
        if [ -z "$T" ] ; then
                T="$I"
        else
                T="$T+$I"
        fi
        let SUMA+=I
#        let I++
done

echo "Suma[$T] = $SUMA"

exit 0



#while numeryczna - suma ciagu arytmetycznego
SUMA=0
N=1000
I=0
T=""
while [ "$I" -le "$N" ] ; do
	if [ -z "$T" ] ; then
		T="$I"
	else
		T="$T+$I"
	fi
	let SUMA+=I
	let I++
done

echo "Suma[$T] = $SUMA"

exit 0
