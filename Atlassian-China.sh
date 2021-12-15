#!/bin/bash

filename=$1

 while read line ; do
 echo $line
 curl -S -s -o /dev/null -w "code: %{http_code} sizeDL: %{size_download} time_total: %{time_total}\n" https://teridion-monitor-api.media.atlassian.com/test/5mb.jpg --resolve atlassian-mediaapi-sfo.d1.teridioncloud.net:443:$line && echo "$line is doing well, what about you?" || echo "$line is failing" 

done < "$filename"
