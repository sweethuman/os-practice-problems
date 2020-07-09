#!/usr/bin/env bash

sed -E -n "s/(t[^ ]+) +pts\/9.*/\1/p" last.fake | sort -u

echo
echo "Now in Awk"
echo

awk '$1 ~ /t[[:alnum:]]+/ && $2 == "pts/9" && !seen[$1]++ { print $1 }' last.fake | sort
