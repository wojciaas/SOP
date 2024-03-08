#!/bin/bash
SUM=0
for var in $(cat $1)
do
	((SUM+=var))	
done
echo $SUM
