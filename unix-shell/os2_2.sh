#!/usr/bin/env bash

files=$(find dir -name '*.c')
found_files=0
for file in $files; do
  if [ $found_files -ge "2" ];then
    break
  fi
  nr_lines=$(wc -l < "$file")
  if [ "$nr_lines" -gt "500" ]; then
    echo "$file"
    found_files+=1
  fi
done

