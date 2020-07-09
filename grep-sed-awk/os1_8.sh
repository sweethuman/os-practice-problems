#!/usr/bin/env bash

sed -E -n "s/^(r[[:alnum:]]+) +.*/\1/p" ps.fake | sort -u | sed -E "s/([aeiou])/\1\1/g"

echo
echo "Now in AWK"
echo

awk '$1 ~ /^r[[:alnum:]]+/ && !seen[$1]++ { print gensub(/([aeiou])/, "\\1\\1", "g", $1)}' ps.fake | sort
