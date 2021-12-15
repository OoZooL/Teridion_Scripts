#!/bin/bash
#$1=$( while IFS="read -r line" )
#ADDRESS=$(cat addresses.txt)
filename=$1
#IFS='\n'
#set -f
while read line ; do
echo $line
curl -S -s -o /dev/null -w "code: %{http_code} sizeDL: %{size_download} time_total: %{time_total}\n"  https://wwweu2.dfsvenue.com/rrdcommon/5MB.txt   --resolve wwweu2.dfsvenue.com:443:$line  && echo "$line is doing well, what about you?"  || echo "$line is failing"

done < "$filename"
