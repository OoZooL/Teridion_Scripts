#!/bin/bash
./logg3r1.sh
echo $?
./logg3r2.sh
echo $?
./logg3r3.sh
echo $?
./logg3r4.sh
echo $?
echo "This concludes the running of the four scripts"
echo $?
find . -cmin -5 -type f -iname '*.log' -exec cat {} \; > merged_file.l0gg3r
echo $?

echo "i********************************************************************************"
echo "******************************** Statistics Section *****************************"
echo "*********************************************************************************"

FILE="./merged_file.l0gg3r"
echo "Number of Fatal errors severity level: $(cat $FILE | grep -i fatal | sort | uniq -c | wc -l)"
echo "Most recurring alert: $(cat $FILE | grep -i fatal | cut -d " " -f 12- -s | sort -nr | uniq -c | head -n 1 )"
echo "Number of Critical errors severity level: $(cat $FILE | grep -i crit | sort | uniq -c | wc -l)"
echo "Most recurring alert: $(cat $FILE | grep -i crit | cut -d " " -f 12- -s | sort -nr | uniq -c | head -n 1 )"
echo "Number of Error severity level: $(cat $FILE | grep -i err | sort | uniq -c | wc -l)"
echo "Most recurring alert: $(cat $FILE | grep -i err | cut -d " " -f 12- -s | sort -nr | uniq -c | head -n 1 )"
echo "Number of Warning errors severity levels: $(cat $FILE | grep -i warn | sort | uniq -c | wc -l)"
echo "Most recurring alert: $(cat $FILE | grep -i warn | cut -d " " -f 12- -s | sort -nr | uniq -c | head -n 1 )"
