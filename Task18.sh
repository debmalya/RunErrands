#!/bin/sh
web_services=("http://localhost:8080/api/football/comp/PL/38")

for i in "${web_services[@]}"
do
  # The parameter -I might be added to improve response load performance. 
  # This parameter just request for status/headers of response, without download response body. (%{http_code} returns on first line of HTTP payload).
  if [ $(curl -s -o /dev/null -i -I -w "%{http_code}\n" $i) ==  "200" ] ;
  then
      echo "$i - OK"
  else
      echo "$i - KO"
  fi
done 
