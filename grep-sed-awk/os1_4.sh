#!/usr/bin/env bash

sed -E -n "s/^root +([^ ]+ +){4}([^ ]+) +.*/\2/p" ps.fake | sort -u

echo
echo "Now in AWK"
echo

awk '$1 == "root" && !seen[$6]++ { print $6 }' ps.fake | sort
