#!/usr/bin/env bash

# Display a report showing the full name of all the users currently connected, and the number of processes belonging to each of them.

username=$(awk '{ print $1 }' who.fake)

for user in $username; do
  count=$(grep -c -E "^$user +" ps.fake)
  echo "$user $count"
done

