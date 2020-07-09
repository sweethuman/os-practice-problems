#!/usr/bin/env bash

sed -E -n "s/^([[:alnum:]]+) ([^ ]+ +){5}23:[0-9]{2} -.*/\1/p" last.fake | sort -u

echo
echo "Now in AWK"
echo

awk '$7 ~ /23:[[:alnum:]]/ && !seen[$1]++ { print $1 }' last.fake | sort
