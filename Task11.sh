#!/bin/sh
# $2 is the location where files will be archived.
# $1 is the location of bad files.

previous_pattern=""
location=$2/`date +%Y%m%d`
echo ${location}
mkdir -p ${location}
count=0
separator="-"
today=`date +%s`

# list all csv files in reverse chronological order with one column output
# latest file will come first. That file we have to preserve.
for file in `ls -1r  $1/*csv`

do
  # to get the file name pattern. File name will follow naming convention <pattern>-<timestamp>-<sequence_number>.csv.
  # "-" marks begining of the timestamp
  current_pattern=`echo ${file/$separator*/$separator}`
  if [ "$current_pattern" == "$previous_pattern" ]
  then
      # move the file to temporary location
      mv $file $location
      count=$(($count+1))
  fi
  previous_pattern=$current_pattern
done

if [ $count -gt 0 ]
then
    tar -cvzf ${location}.tar.gz ${location} >> /dev/null
fi


# Remove files which are older than 9 days
for file in `ls -1v $2`
do
    # remove .tar.gz from the file name get YYYYMMDD format date
    file_prefix=`echo $file | sed -e "s/.tar.gz//g"`
    file_date=`date -d "${file_prefix}" +%s`

    # find out the difference in day
    days_between=`echo $(( ($today - $file_date) / 86400 ))`
    if [ $days_between -gt 9 ]
    then
         echo "deleting..."
         echo "${file}"
         rm ${location}/${file}
    else
         break
    fi
done

