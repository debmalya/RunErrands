#!/bin/sh
for i in {10..29}
do
   head -n 1 fileWithHeader.csv > tmp_file
   cat fileWithoutHeader_00$i >> tmp_file
   mv tmp_file fileWithoutHeader_00$i
done
