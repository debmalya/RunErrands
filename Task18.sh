#!/bin/bash
web_services=("http://localhost:8080/api/football/comp/PL/38" "http://localhost:8080/app/job/search?wsdl")

# This works in mac os
yesterday=`date -v-1d +%F`

# For Linux
# yesterday=`date -d "yesterday 13:00" '+%Y-%m-%d'`

#echo "$yesterday"
hour=`date +"%H"`
minute=`date +"%M"`
echo "$hour"
echo "$minute"
if [ $hour == "07" -a $minute == "03" ];
then
   echo "Now is the time to rotate file"
   mv webserice_access.log webservice_access_$yesterday.log
fi

for i in "${web_services[@]}"
do
  # The parameter -I might be added to improve response load performance. 
  # This parameter just request for status/headers of response, without download response body. (%{http_code} returns on first line of HTTP payload).
  epoch_time=`date +%s`
  # tested in mac os
  status=$(curl -s -o /dev/null -i -I -w "%{http_code}\n" $i)
  end_time=`date +%s`
  response_time=`expr $end_time - $epoch_time`
  SUBSTRING=$(echo $i| cut -d'?' -f 1)
  if [ $status ==  "200" ] ;
  then
      echo "$i - OK"
      echo "WEBSERVICE_MONITOR|$i|$epoch_time|$status|SUCCESS||$response_time" >> webservice_access.log
  else
      echo "WEBSERVICE_MONITOR|$i|$epoch_time|$status|FAILURE||$response_time" >> webservice_access.log
      echo "$i - KO"
  fi
done 
