#!/usr/bin/env bash

# Consider a file containing a username on each line. Generate a comma-separated string with email addresses of the users that exist.
# The email address will be obtained by appending "@scs.ubbcluj.ro" at the end of each username.
# Make sure the generated string does NOT end in a comma. 

emails=""

while read -r username; do
  if grep -E -q "^$username:" passwd.fake; then
    emails+=$username
    emails+="@scs.ubbcluj.ro,"
  fi
done < "$1"
echo "$emails" | sed "s/,$//"
