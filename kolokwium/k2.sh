#!/bin/bash

FILE="$1"
ARG="$2"

[ ! -e "$FILE" ] && echo "$FILE nie istnieje" && exit 1
[ ! -f "$FILE" ] && exit 1
[ ! -r "$FILE" ] && exit 1
[ ! -w "$FILE" ] && exit 1
[ ! $(echo "$ARG" | egrep "^([0-9]|[A-z])+$") ] && exit 1
TMP="tmp.txt"
touch "$TMP"
for L in $(cat "$FILE") ; do
	echo -n "$ARG $L " >> "$TMP"
	(echo "$ARG" | rev) >> "$TMP"
done
cat "$TMP" > "$FILE"
rm "$TMP"
 

