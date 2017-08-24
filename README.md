# RunErrands
Sometimes some adhoc tasks come. To prepare scripts to attand such call.

* Task 1: Copy files which contains data for peak hours (17:00 - 19:59), first parameter is the destination directory.
* Task 2: Copy files which contains data for peak hours (17:00 - 19:59), first parameter is the source directory, second parameter is the destination directory. 
* Task 3: Copy files which contains data for peak hours (17:00 - 20:00), here file name is datetime (e.g. 201708091858)
* Task 4: Extract all gz files in the passed directory.
* Task 5: Count total number of files in a specific directory. Directory name will be passed as an argument.
* Task 6: For each file, there should be a control file. Control file has the same name with the file, only they have an extension *.ctl and they do not have any content.
* Task 7: Each directory contains files processed for three hours. We have to check total how many files are there. Then there will an argument time ( >= 5 && <= 60 ) to the method. We need copy that much files to another directory (passed as second argument to this method) [TO DO].
* Task 8: Split a file into multiple files. Each file cannot contain more than specified number of records (e.g. 1000000) [TO DO]
* Task 9: In directory there are files with extension DAT, We have to create file with same name, but extenstion will be .CTL (e.g. there is a file a.DAT, for a.DAT We have to create a.CTL
* Task 10: Write a command to get the latest file name from the specified directory.
* Task 11: From a directory we have to keep the most latest file, remaining files will be compressed and stored into a specified archive folder. After archiving, all those files will be deleted [TO DO]

GNU bash, version 4.1.2(1)-release (x86_64-redhat-linux-gnu)
