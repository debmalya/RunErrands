#!/bin/bash
first_file=0
# Parameter 1: name of the final file (after merging)
for file in *
do
  if [ $first_file -eq 0 ]
  then
     cat $file >$1
     first_file=1
  else
     sed 1d $file >>$1
  fi
done
