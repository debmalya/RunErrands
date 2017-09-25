#!/bin/sh
# We have input files with following format
# <MSISDN>|<NAME>
# e.g. 1|ONE
# from this input file we have to split files based on passed number of lines in each file, parameter 1
# First, store MSISDN in temporary file
awk -F"|" '{print $1}' > ONLY_MSISDN.txt
split -d --numeric_suffixes --lines=$1 ONLY_MSISDN.txt
# Linux singtel-dev 3.10.0-693.el7.x86_64 #1 SMP Thu Jul 6 19:56:57 EDT 2017 x86_64 x86_64 x86_64 GNU/Linux
