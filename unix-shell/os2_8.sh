#!/usr/bin/env bash

awk '(int($2) < 1024 || int($5) > 80)&& NR!=1 { print $6 }' df.fake
