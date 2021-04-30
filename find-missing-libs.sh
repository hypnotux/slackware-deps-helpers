#!/bin/bash

for dir in /bin /sbin /usr/bin /usr/sbin /lib /lib64 /usr/lib /usr/lib64 /usr/libexec; do
  echo "Scanning libs in $dir..." 1>&2

  find "$dir" -type f -exec ldd {} 2> /dev/null \; \
    | grep 'not found' \
    | sed 's/\t//' \
    | cut -f1 -d' '
done
