#!/usr/bin/env bash

sed -E "s/[[:alnum:] ]//g" passwd.fake | sort -u

echo
echo "Now in AWK"
echo

awk '{ a = gensub(/[[:alnum:] ]/, "", "g", $0); if(!seen[a]++){print a}}' passwd.fake | sort -u
