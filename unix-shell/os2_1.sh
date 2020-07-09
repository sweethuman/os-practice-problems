#!/usr/bin/env bash

users=$(sed -E -n 's/([[:alnum:]]+) +.*/\1/p' who.fake)

for user in $users; do
  nr_processes=$(sed -E -n "s/^$user +.*/1/p" ps.fake | wc -l)
  echo "$user $nr_processes"
done
