#!/bin/bash

if [ "$#" -eq 0 ]; then
	echo "Podaj współczynniki: "
	echo -n "Wspołczynnik a = "
	read A
	echo -n "Współczynnik b = "
	read B
	echo -n "Współczynnik c = "
	read C
else
	A="$1"
	B="$2"
	C="$3"
fi

DELTA=$(echo "scale=2;($B*$B)-(4*$A*$C)"|bc)

if echo "$DELTA" | grep "^-" > /dev/null; then
	echo "DELTA = $DELTA jest mniejsza od 0 - równanie nie ma pierwiastków!"
	exit 1
elif echo "$DELTA" | grep "0" > /dev/null; then
	X=$(echo "scale=2;(($B*-1)/2*$A)"|bc) 
	echo "DELTA = $DELTA - jedyny pierwiastek to x = $X"
	exit 0
else
	X1=$(echo "scale=2;((($B*-1)-sqrt($DELTA))/2*$A)"|bc)
	X2=$(echo "scale=2;((($B*-1)+sqrt($DELTA))/2*$A)"|bc)
	echo "DELTA = $DELTA"
	echo "X_1 = $X1"
	echo "X_2 = $X2"
fi
exit 0
