#!/bin/sh

previous_pattern=""
location=$2/`date +%Y%m%d`
echo ${location}
mkdir -p ${location}

# list all csv files in reverse chronological order with one column output
# latest file will come first. That file we have to preserve.
for file in `ls -1r  $1/*csv`

do
  # to get the file name pattern. File name will follow naming convention <pattern>-<timestamp>-<sequence_number>.csv.
  # "-" marks begining of the timestamp
  separator="-"
  current_pattern=`echo ${file/$separator*/$separator}`
  if [ "$current_pattern" == "$previous_pattern" ]
  then
      # move the file to temporary location
      mv $file $location
  fi
  previous_pattern=$current_pattern
done

tar -cvzf ${location}.tar.gz ${location} >> /dev/null
rm -rf ${location}
