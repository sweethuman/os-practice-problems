#!/usr/bin/env bash

sed -E 's/[^r]//g' passwd.fake | sort -u

echo
echo "Now in AWK"
echo

awk '{a = gensub(/[^r]/, "", "g", $0); if(!seen[a]++){print a}}' passwd.fake | sort
