#!/bin/bash
first_file=0
# Parameter 1: name of the merged_file


if [ $# -ne 1 ]
then
   echo "missing required number of parameters."
   exit 1
fi

if [ -e $1 ]
then
   rm $1
fi


for file in *
do
  echo $file
  if [ $first_file -eq 0 ]
  then
     touch $1
     cat $file >$1
     first_file=1
  else
     #sed 1d $file >>$1
     cat $file >>$1
  fi
done
