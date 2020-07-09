#!/usr/bin/env bash

sed -E -n 's/^[[:alnum:]]+88:([^:]+:){3}([^:]+):.+/\2/p' passwd.fake

echo
echo "Now in AWK"
echo

awk -F: '$1 ~ /[[:alnum:]]+88/ { print $5 }' passwd.fake
