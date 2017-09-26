#!/bin/bash
start=0

for file in *
do
  if [ $start -eq 0 ]
  then
     cat $file >merged_file.txt
     start=1
  else
     sed 1d $file >>merge_file.txt
  fi
done
