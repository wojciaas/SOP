#!/bin/bash

S=$(pwd)

for E in $(ls "$S") ; do
	[ ! -f "$E" ] && exit 1
	for N in $(cat "$E") ; do
		[ $(egrep -i "^[/*main*/]" "$E") -gt 0 ] && break
		echo "$E"
	done
done
