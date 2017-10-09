#!/bin/sh
# First argument is the direcotry where we are searching for the files
for i in {1..30}
do
   find $1 -cmin $i
done
