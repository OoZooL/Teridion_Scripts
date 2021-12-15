#!/bin/bash

./updater.sh

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

cat ports.htm | grep "$1" | grep -v "Wii\|Switch\|Playstation 3\|Playstation 4\|Xbox 360\|Xbox One" > "$GAMENAME"-PC-version.txt
cat ports.htm | grep "$1" | grep "Switch" > "$GAMENAME"-Switch-version.txt
cat ports.htm | grep "$1" | grep "Wii" > "$GAMENAME"-Wii.txt
cat ports.htm | grep "$1" | grep "Playstation 3" > "$GAMENAME"-PS3.txt
cat ports.htm | grep "$1" | grep "Playstation 4" > "$GAMENAME"-PS4.txt
cat ports.htm | grep "$1" | grep "Xbox 360" > "$GAMENAME"-Xbox360.txt
cat ports.htm | grep "$1" | grep "Xbox One" > "$GAMENAME"-XboxOne.txt
cat "$GAMENAME"-PC-version.txt | cut -d "\"" -f 6 | cut -d " " -f 2-20 > "$1"-PC-version-clean.txt
cat "$1"-Switch-version.txt | cut -d "\"" -f 6 | cut -d " " -f 2-20 > "$1"-Switch-version-clean.txt
cat "$1"-Wii.txt | cut -d "\"" -f 6 | cut -d " " -f 2-20 > "$1"-Wii-clean.txt
cat "$1"-PS3.txt | cut -d "\"" -f 6 | cut -d " " -f 2-20 > "$1"-PS3-clean.txt
cat "$1"-PS4.txt | cut -d "\"" -f 6 | cut -d " " -f 2-20 > "$1"-PS4-clean.txt
cat "$1"-Xbox360.txt | cut -d "\"" -f 6 | cut -d " " -f 2-20 > "$1"-Xbox360-clean.txt
cat "$1"-XboxOne.txt | cut -d "\"" -f 6 | cut -d " " -f 2-20 > "$1"-XboxOne-clean.txt
cat "$1"-PC-version-clean.txt | cut -d "," -f 2-20 > "$1"-PC-version-cleaner.txt
cat "$1"-Switch-version-clean.txt | cut -d "," -f 2-20 > "$1"-Switch-version-cleaner.txt
cat "$1"-Wii-clean.txt | cut -d "," -f 2-20 > "$1"-Wii-cleaner.txt
cat "$1"-PS3-clean.txt | cut -d "," -f 2-20 > "$1"-PS3-cleaner.txt
cat "$1"-PS4-clean.txt | cut -d "," -f 2-20 > "$1"-PS4-cleaner.txt
cat "$1"-Xbox360-clean.txt | cut -d "," -f 2-20 > "$1"-Xbox360-cleaner.txt
cat "$1"-XboxOne-clean.txt | cut -d "," -f 2-20 > "$1"-XboxOne-cleaner.txt
rm -rf "$GAMENAME"-PC-version.txt
rm -rf "$GAMENAME"-Switch-version.txt
rm -rf "$GAMENAME"-Wii.txt
rm -rf "$GAMENAME"-PS3.txt
rm -rf "$GAMENAME"-PS4.txt
rm -rf "$GAMENAME"-Xbox360.txt
rm -rf "$GAMENAME"-XboxOne.txt
rm -rf "$GAMENAME"-PC-version-clean.txt
rm -rf "$GAMENAME"-Switch-version-clean.txt
rm -rf "$GAMENAME"-Wii-clean.txt
rm -rf "$GAMENAME"-PS3-clean.txt
rm -rf "$GAMENAME"-PS4-clean.txt
rm -rf "$GAMENAME"-Xbox360-clean.txt
rm -rf "$GAMENAME"-XboxOne-clean.txt
mkdir "$GAMENAME"
cd "$GAMENAME"
mv ../"$GAMENAME"* .
head -n 2 "$GAMENAME"-PC-version-cleaner.txt > interim_PC_tcp_ports_file
tail -n 1 "interim_PC_tcp_ports_file" | cut -d "'" -f 4 > "$GAMENAME"_PC_version_tcp_ports.txt
head -n 2 "$GAMENAME"-PC-version-cleaner.txt > interim_PC_udp_ports_file
tail -n 1 "interim_PC_udp_ports_file" | cut -d "'" -f 6 > "$GAMENAME"_PC_version_udp_ports.txt
cat "$GAMENAME"-Switch-version-cleaner.txt | cut -d "'" -f 4 > "$GAMENAME"_Switch_tcp_ports.txt
cat "$GAMENAME"-Switch-version-cleaner.txt | cut -d "'" -f 6 > "$GAMENAME"_Switch_udp_ports.txt
cat "$GAMENAME"-PS3-cleaner.txt | cut -d "'" -f 4 > "$GAMENAME"_PS3_tcp_ports.txt
cat "$GAMENAME"-PS3-cleaner.txt | cut -d "'" -f 6 > "$GAMENAME"_PS3_udp_ports.txt
cat "$GAMENAME"-PS4-cleaner.txt | cut -d "'" -f 4 > "$GAMENAME"_PS4_tcp_ports.txt
cat "$GAMENAME"-PS4-cleaner.txt | cut -d "'" -f 6 > "$GAMENAME"_PS4_udp_ports.txt
cat "$GAMENAME"-Wii-cleaner.txt | cut -d "'" -f 4 > "$GAMENAME"_Wii_tcp_ports.txt
cat "$GAMENAME"-Wii-cleaner.txt | cut -d "'" -f 6 > "$GAMENAME"_Wii_udp_ports.txt
cat "$GAMENAME"-Xbox360-cleaner.txt | cut -d "'" -f 4 > "$GAMENAME"_Xbox360_tcp_ports.txt
cat "$GAMENAME"-Xbox360-cleaner.txt | cut -d "'" -f 6 > "$GAMENAME"_Xbox360_udp_ports.txt
cat "$GAMENAME"-XboxOne-cleaner.txt | cut -d "'" -f 4 > "$GAMENAME"_XboxOne_tcp_ports.txt
cat "$GAMENAME"-XboxOne-cleaner.txt | cut -d "'" -f 6 > "$GAMENAME"_XboxOne_udp_ports.txt
rm -rf *cleaner*
rm -rf *interim*

echo "All actions completed successfully"
