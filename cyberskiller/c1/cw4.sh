#!/bin/bash
X=$1
i=1;
while [ $i -le $X ]; do 
	echo "LOOP $i"
	i=$[i+1]
done

exit 0
