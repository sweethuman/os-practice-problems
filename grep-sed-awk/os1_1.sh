#!/usr/bin/env bash

grep -E "([a-z0-9/]+ +){2,2} +economica.+ Sun" last.fake | sed -E 's/^([a-z0-9]+) .*/\1/' | sort -u

echo
echo 'Now in AWK'
echo

awk '$3 ~ /economica./ && $4 == "Sun" && !seen[$1]++ { print $1 }' last.fake
