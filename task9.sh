#!/bin/sh
for file in *.DAT
do
  echo $file
  fname="${file%.*}"
  touch "$fname".CTL
done
