#!/usr/bin/env bash

files=$(find dir_3 -name "*.log")

for file in $files; do
  output=$(sort "$file")
  echo "$output" > "$file"
done
