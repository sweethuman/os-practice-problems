#!/usr/bin/env bash

echo "scale=2; ($(sed -E -n 's/^[^ ]+ +([[:digit:]]+) +.*/\1/p' ps.fake | paste -sd'+'))/$(wc -l < ps.fake)" | bc -l

echo
echo "Now in AWK"
echo

awk '{sum+=$2} END {print sum/NR}' ps.fake
