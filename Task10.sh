#!/bin/sh
# from ls -lrt take the last line
# after taking the last line split it by ' ' and take the last string which is the file name
latest_file_name=`ls -lrt | tail -1 | awk '{printf $9}'`
echo ${latest_file_name}
