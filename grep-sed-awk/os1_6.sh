#!/usr/bin/env bash

sed -E -n 's/^[[:alpha:]]+023[[:digit:]]:([^:]+:){3}([^:]+):.*/\2/p' passwd.fake

echo
echo "Now in AWK"
echo

awk -F: '$1 ~ /^[[:alpha:]]+023[[:digit:]]/ { print $5 }' passwd.fake
