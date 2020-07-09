#!/usr/bin/env bash

# this is based on a test file
# we are assuming what is in the file is the current month
# instead of `cat last.fake` it would be last -s $(date +'%Y-%m-00')

cat last.fake | sed -E 's/([^ ]+) +.+/\1/' | sort | uniq -c | sort -nr
