#!/usr/bin/env bash

files=$(find dir_6 -perm -o=w)

function filestatus {
  ls -l "$1" | sed -E 's/^(.{10} +)([^ ] +){7}/\1/'
}
for file in $files; do
  filestatus "$file"
  chmod o-w "$file"
  filestatus "$file"
done
  
