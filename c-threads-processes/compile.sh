#!/usr/bin/env bash

ex_name=$(echo "$1" | sed -E 's/(.+)\.c$/\1/')

if gcc -pthread -Wall -Wextra -g -o "bin/$ex_name" "$1"; then
  read -p "Run Program?(y/N) " -n 1 -r
  echo
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    ./bin/"$ex_name"
  fi
fi
