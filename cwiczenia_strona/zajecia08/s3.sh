#!/bin/bash

[ $# -ne 3 ] && exit 1
IN="$1"
OUT1="$2"
OUT2="$3"
[ ! -f "$IN" ] && exit 2
[ ! -r "$IN" ] && exit 2
[ -e "$OUT1" ] && [ ! -f "$OUT1" ] && exit 2
[ -e "$OUT2" ] && [ ! -f "$OUT2" ] && exit 2
rm -f "$OUT1"
rm -f "$OUT2"
IFS=$'\n'
for L in $(cat "$IN") ; do
	IFS=$' \t\n'
	for E in $(echo "$L") ; do
		D=$(echo -n "$E" | wc -c)
		if [ "$D" -ne 1 ] ; then
			rm -f "$OUT1"
			rm -f "$OUT2"
		fi
		if echo "$E" | egrep "^[0-9]$" > /dev/null ; then
			echo -n "$E " >> "$OUT1"
		else
			echo -n "$E " >> "$OUT2"
		fi
	done
	echo >> "$OUT1"
	echo >> "$OUT2"
done
