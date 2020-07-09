#!/usr/bin/env bash

usernames=$(sed -E 's/^([[:alnum:]]+):+.*/\1/' passwd.fake)
string=""
for username in $usernames; do
  string+="$username"
  string+="@scs.ubbcluj.ro,"
done
echo "$string" | sed -E 's/^(.+),$/\1/'
