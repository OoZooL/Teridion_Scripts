#!/bin/bash
wget https://portforward.com/ports.htm -O site.txt
Current=$(md5sum < ports.htm | cut -d " " -f 1)
echo $Current
Site=$(md5sum < site.txt | cut -d " " -f 1)
echo $Site
if [ "$Current" == "$Site" ]; then
        echo "Nothing to do, all is well." && rm -f site.txt
else
        echo "Downloading new file momentarily, please stand by..." && rm -f ports.htm && wget https://portforward.com/ports.htm
fi
~
