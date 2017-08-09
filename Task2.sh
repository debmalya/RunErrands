#!/bin/sh
for file in $1/*
do
   filetime=`ls -lrt "$file" | awk '{printf $8}'`
   hour=${filetime:0:2}
   if [ $hour -ge 17 -a $hour -le 19 ]
   then
      cp "$file" $2
   fi
done
