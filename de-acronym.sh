#!/bin/bash

INPUT=$1

OUTPUT=$(cat dictionary.txt | grep $INPUT -A 1 | uniq | tail -n 1)
cat dictionary.txt | grep "$OUTPUT"
        if [ $? -eq 0 ]
        then echo "Acronym found, reconstructing into full term and running with it" && game-ports.sh "$OUTPUT"
else echo "Acronym was not found, try adding it up using acronym.sh"
fi
