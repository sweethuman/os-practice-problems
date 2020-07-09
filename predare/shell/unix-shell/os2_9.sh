#!/usr/bin/env bash

find "$1" -type f | xargs md5sum | sort -n | uniq -w32 --all-repeated=separate | sed -E 's/([^ ]+) +(.*)/\2/'

