# RunErrands
Sometimes some adhoc tasks come. To prepare scripts to attend such calls.

* Task 1: Copy files which contains data for peak hours (17:00 - 19:59), first parameter is the destination directory.
* Task 2: Copy files which contains data for peak hours (17:00 - 19:59), first parameter is the source directory, second parameter is the destination directory. 
* Task 3: Copy files which contains data for peak hours (17:00 - 20:00), here file name is datetime (e.g. 201708091858)
* Task 4: Extract all gz files in the passed directory.
* Task 5: Count total number of files in a specific directory. Directory name will be passed as an argument.
* Task 6: For each file, there should be a control file. Control file has the same name with the file, only they have an extension *.ctl and they do not have any content.
* Task 7: Each directory contains files processed for three hours. We have to check total how many files are there. Then there will an argument time ( >= 5 && <= 60 ) to the method. We need copy that much files to another directory (passed as second argument to this method) [TO DO].
* Task 8: Split a file into multiple files. Each file cannot contain more than specified number of records (e.g. 1000000) 
* Task 9: In directory there are files with extension DAT, We have to create file with same name, but extenstion will be .CTL (e.g. there is a file a.DAT, for a.DAT We have to create a.CTL
* Task 10: Write a command to get the latest file name from the specified directory.
* Task 11: In a directory, we store all the files which have some errors. File naming convention is BAD_RECORDS_FOOTBALLL_<TIMESTAMP>, BAD_RECORDS_CRICKET_<TIMESTAMP>. From that we have to keep the latest file of each cateogory (e.g. BAD_RECORDS_FOOTBALL, BAD_RECORDS_CRICKET) and remainging files we have to make a tar and delete them.  
* Task 11a: The tar files created in task 11, should be kept for 10 days. If the file is more than 10 days we have to delete those files. File naming format is YYYYMMDD.tar.gz (e.g. 20170827.tar.gz,20170901.tar.gz,20170902.tar.gz,20170903.tar.gz,20170904.tar.gz)
* Task 12: Check whether mentioned file exists or not.
* Task 13: Find the files which are modified in last specified miniutes (duration in minute will be passed as command line parameter).
* Task 14: Merge all the files in the current directory. 
* Task 15: List all the files which are changed in last half an hour.
* Task 17: I have file with header. This file has around 7 million records, want to split this file such a way that each file will have maximum 100,000 records. While splitting each file must have the header.  [TO DO]
* Task 18: We have web services running. This script should monitor web services. If the web service got http response code 200 then print 'OK' otherwise 'KO'.

Scrips are executed in GNU bash, version 4.1.2(1)-release (x86_64-redhat-linux-gnu)
