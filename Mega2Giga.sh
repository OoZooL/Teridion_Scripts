#!/bin/bash
#Written by Aleksandr Sannikov and modified slightly by Doron Volkovich
echo "Traffic converter"
echo "8.04.2017 - v0.1 - current version takes a file 'traffic_report.txt' as an input and changes all the MB-values to GB-values"
echo "Output is rewriting to the same file: 'traffic_report.txt'"
#ONLY_DIGITS=`grep -o '[0-9]*\.[0-9]*' traffic_report.txt`
#echo "${ONLY_DIGITS}"
#MB=1024
MEGABYTES=$(grep -o '[0-9.]*.[0-9.]* MB' traffic_report.txt | grep -o '[0-9.]*.[0-9.]*') 
#receiving megabytes digits as a text column
#echo $MEGABYTES
for VALUE in ${MEGABYTES}  #extract each digit from a text column
do
        #echo "ITEM: ${VALUE}"
        GIGABYTES=$(awk "BEGIN {print ${VALUE}/1024}") #permorm division of a floating-point variables
        grep -l ${VALUE} traffic_report.txt | xargs sed -i 's/'${VALUE}' MB/'${GIGABYTES}' GB/g'   #replacing original MB-values with the new MB-values
        #echo "${MEGABYTES}" >> output.txt #adding a converted value to a file - NOT NEEDED ANYMORE
done
echo "Changes has been successfully rewrited to 'traffic_report.txt'"
