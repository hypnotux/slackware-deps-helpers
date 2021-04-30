#!/bin/bash

for section in a ap d e f k kde l n t tcl x xap xfce y; do
  sectiondir=/mnt/cdrom/slackware64/$section

  for pkgpath in $(ls $sectiondir/*.t?z); do
    for file in $(tar -tf $pkgpath); do
      printf "%s\t%s\n" "$pkgpath" "$file"
    done 
  done
done
