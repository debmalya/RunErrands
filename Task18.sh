#!/bin/sh
web_services=("http://localhost:8080/api/football/comp/PL/38")

for i in "${web_services[@]}"
do
  # The parameter -I might be added to improve response load performance. 
  # This parameter just request for status/headers of response, without download response body. (%{http_code} returns on first line of HTTP payload).
  epoch_time=`date +%s`
  status=$(curl -s -o /dev/null -i -I -w "%{http_code}\n" $i)
  echo $status
  if [ $status ==  "200" ] ;
  then
      echo "$i - OK"
      echo "WEBSERVICE_MONITOR|$i|$epoch_time|$status|SUCCESS|" >> webservice_access.log
  else
      echo "WEBSERVICE_MONITOR|$i|$epoch_time|$status|FAILURE|" >> webservice_access.log
      echo "$i - KO"
  fi
done 
