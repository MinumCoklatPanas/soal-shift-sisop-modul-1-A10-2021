#!/bin/bash
#cut -d " " -f 1-3 $filename_log
#grep -oE "(ERROR)(.*)\(.*\)" syslog.log | sort | uniq | cut -d " " -f 2-  
filename_log="syslog.log"
#a
INFO=`grep -E "INFO" "$filename_log"`
ERROR=`grep -E "ERROR" "$filename_log"`

countinfo=`printf "$INFO" | wc -l`
counterror=`printf "$ERROR" | wc -l`
#b
listerror=`printf "$ERROR" | grep -Po "(?<=ERROR )(.*)(?=\()" | sort | uniq -c | sort -nr`
#c
listuser=`grep -Po "(?<=\()(.*)(?=\))" "$filename_log" | sort | uniq`
#d
filename_error="error_message.csv"
echo "Error, Count" > "$filename_error"

printf "$listerror" | while read lineerror
do
	errortype_now=`echo $lineerror | cut -d ' ' -f 2-`
		count_now=`echo $lineerror | cut -d ' ' -f 1`
		echo "$errortype_now,$count_now" >> "$filename_error"
done
cat "$filename_error"
#e
filename_user="user_statistic.csv"
echo "Uname_input,INFO,ERROR" > "$filename_user"
printf "$listuser" | while read uname_input
do
	count_nowinfo=`printf "$INFO" | grep -E "(INFO).*(\($uname_input\))" | wc -l`
	count_nowerror=`printf "$ERROR" | grep -E "(ERROR).*(\($uname_input\))" | wc -l`
	echo "$uname_input,$count_nowinfo,$count_nowerror" >> "$filename_user"
done
cat "$filename_user"
