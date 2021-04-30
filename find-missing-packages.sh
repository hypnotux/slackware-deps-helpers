#!/bin/bash

LIBSFILE=$1
FILELISTFILE=$2
FORMAT="%s\t%s\n"

usage() {
  echo "Usage: $0 <libs-file> <filelist-file>"
  exit 1
}

[ $# -ne 2 ] && usage
[ -f $1 ] || usage
[ -f $2 ] || usage

for lib in $(cat "$LIBSFILE"); do
  pkg="$(grep "$lib" "$FILELISTFILE" | cut -f1 -d'	')"

  if [ -z "$pkg" ]; then
    printf "$FORMAT" "$lib" 'not found' 1>&2
  else
    printf "$FORMAT" "$lib" "$pkg"
  fi
done
