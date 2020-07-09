#!/usr/bin/env bash

awk -F: '$1 ~ /^m[[:alnum:]]/ && substr($1,5,4) % 7 == 0 { print $5 }' passwd.fake
