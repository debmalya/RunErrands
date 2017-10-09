#!/bin/sh
# if $1 is 1 minute, then whatever files are changed in last 1 minute their name will be listed.
find -cmin $1
