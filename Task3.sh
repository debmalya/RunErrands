#!/bin/sh
for file in $1/*
do
   filetime=`ls -lrt "$file" | awk '{printf $9}'`
   hour=`echo $filetime | tail -c 5`
   if [ $hour -ge 1700 -a $hour -le 2000 ]
   then
      cp "$file" $2
   fi
done
