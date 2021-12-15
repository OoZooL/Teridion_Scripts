#!/bin/bash
GAMENAME=$1

if [ -e ports.htm ]
        then echo "Ports file is already downloaded."
else
wget https://portforward.com/ports.htm
fi

if [ -z "$GAMENAME" ]
        then
        echo "Please provide a name of a game you would like to get the relevant port list to"
        exit
fi

content2acronym=$(cat ports.htm | grep "$1" | grep -v "Wii\|Switch\|Playstation 3\|Playstation 4\|Xbox 360\|Xbox One" > "$1"-PC-version.txt)

#sed 's/\(.\)[^ ]* */\1/g'
acronym=$(ls "$1"-PC-version.txt | sed -e 's/$/ /' -e 's/\([^ ]\)[^ ]* /\1/g' -e 's/^ *//')

cat dictionary.txt | grep "$acronym"
        if [ $? -ne 0 ]
        then echo $acronym >> dictionary.txt
else echo "value appears in the dictionary already"
fi

cat dictionary.txt | grep "$1"
        if [ $? -ne 0 ]
        then echo $1 >> dictionary.txt
else echo "value appears in the dictionary already"
fi

rm -rf "$1"-PC-version.txt

Entry=$(cat dictionary.txt | grep "$acronym" -A 1 | uniq | tail -n 1)
./game-ports.sh "$Entry"
