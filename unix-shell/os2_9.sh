#!/usr/bin/env bash

md5sum $(find dir) 2> /dev/null | sort -k1 -n | uniq -w32 --all-repeated=separate | sed -E 's/([^ ]+) +(.*)/\2/'

