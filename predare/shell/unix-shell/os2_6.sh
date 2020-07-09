#!/usr/bin/env bash

# Find recursively in a directory, all the files that have write permissions for everyone. 
# Display their names, and the permissions before and after removing the write permission for everybody.
# You will need to use chmod's symbolic permissions mode, instead of the octal mode we have used in class. The the chmod manual for details. 

find dir -perm -o=w -type f | while read -r line; do
  echo "$(ls -l "$line" | grep -E -o "^[-rwx]{10}")" "$line"
  chmod o-w "$line"
  echo "$(ls -l "$line" | grep -E -o "^[-rwx]{10}")" "$line"
done
