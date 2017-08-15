#!/bin/sh
for file in $1/*
do
   touch "$file".CTL
done
