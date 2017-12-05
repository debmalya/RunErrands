#!/bin/sh
# We have input files with following format
# <MSISDN>|<NAME>
# e.g. 1|ONE
# Parameter 1: Field containing MSISDN
# Parameter 2: Number of lines in each file
# Paramerer 3: Input file name
# from this input file we have to split files based on passed number of lines in each file, parameter 1
# First, store MSISDN in temporary file
awk -F"|" '{print $1}' $3 > ONLY_MSISDN.txt
split -d --numeric_suffixes --lines=$2 ONLY_MSISDN.txt
rm ONLY_MSISDN.txt
# Linux x86_64 x86_64 x86_64 GNU/Linux
