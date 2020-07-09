#!/usr/bin/env bash

while :
do
  processes=$(ps -e)
  for arg in "$@"; do
    result=$(echo "$processes" | sed -E -n "s/([^ ]+) +([^ ]+ +){2}$arg.*/\1/ip")
    if [ -n "$result" ]; then
      for pid in $result; do
        kill -9 "$pid"
        echo "killed $arg"
      done
    fi
  done
done
