#!/usr/bin/env bash

# Find recursively in a directory all ".c" files having more than 500 lines. Stop after finding 2 such files.

files_found=0

find dir -type f -name "*.c" | while read -r file;do
  if [ $files_found -ge 2 ];then
    break
  fi
  lines=$(wc -l "$file" | grep -o -E "^[0-9]* ")
  if [ $lines -ge 500 ]; then
    echo "$file"
    files_found=$(($files_found + 1))
  fi
done
