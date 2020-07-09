#!/usr/bin/env bash

files=$(find dir)

for file in $files; do
  if [ -L "$file" ] && [ ! -e "$file" ];then
    echo "$file"
  fi
done
