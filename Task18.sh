#!/bin/sh
web_services=("http://localhost:8080/api/football/comp/PL/38")

for i in "${web_services[@]}"
do
  if [ $(curl -s -o /dev/null -w "%{http_code}\n" $i) ==  "200" ] ;
  then
      echo "$i - OK"
  else
      echo "$i - KO"
  fi
done 
