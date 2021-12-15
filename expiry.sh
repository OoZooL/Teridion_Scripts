#!/bin/bash

SITE=$1

A=$(date)

if [ -z $1 ]
        then echo "Please enter a site to check its SSL certificate"
        else echo "One moment please"
fi

DELTA=$(echo | openssl s_client -servername $SITE -connect $SITE:443 2>/dev/null | openssl x509 -noout -dates)
echo $DELTA
B=$(echo $DELTA | grep notAfter | cut -d " " -f 6-12 | cut -d"=" -f 2)
echo $B

#echo $(( (`date -d $DELTA2 +%s`) - `date -d $A +%s` / 86400 )) days
Delta3=$(echo "( `date -d "$B" +%s` - `date -d "$A" +%s`)"  | bc -l)
#echo "select datediff('$DELTA2', '$(date -s) ');"  | mysql -N
CurrentDate=$(date +%s)

bc <<< $CurrentDate+$Delta3
#echo $(( 20 - 5 ))

