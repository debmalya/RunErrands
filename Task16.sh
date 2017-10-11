#!/bin/sh
############################################################################################
#  Create script to create a new file every 30 minutes and FTP file to mRewards Server     #
############################################################################################
location=$1
touch $location/Event_Sink_FS1-1507618900-4.csv
touch result.txt
# Check all those files which are modified in last half an hour
for i in {0..30}
do
   array=`find $location -cmin $i`
   for i in "${array[@]}"
   do
       # if not empty
       if [ ! -z "$i" ]
       then
          # match all the lines which contain mRewardTopupFeed_Trigger RECORD_TIMESTAMP TRANSACTION_VALUE
          records=`grep  'mRewardTopupFeed_Trigger.*RECORD_TIMESTAMP.*TRANSACTION_VALUE' $i`
          echo $records > result.txt
          if [ ! -z "$records" ]
          then
              awk 'BEGIN {FS=","; } {
                          fields = 1
                          while ( field <=NF ){
                                  if ( field > 1 ) {

                                     if ( match( $field , "mRewardTopupFeed_Trigger" ) != 0 ) {
                                          printf "Field name :%s \n", $field
                                          field++
                                          printf "MSISDN : %s \n", $field
                                     }
                                     else if ( match( $field , "TRANSACTION_VALUE" ) != 0 ) {
                                          field++
                                          printf "transaction value: %s \n", $field
                                     }
                                     else if ( match( $field , "RECORD_TIMESTAMP" ) != 0 ) {
                                          field++
                                          printf "record timestamp: %s \n", $field
                                     }
                                 } 
                                 field++

                          }
                      }' result.txt >> output.txt
          fi
       fi
   done
done
