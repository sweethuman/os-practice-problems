#!/usr/bin/env bash

#	Display all the mounted file systems who are either smaller than than 1GB or have less than 20% free space.

awk 'int($2) < 1024 || int($5) > 80 {print $6}' df.fake
