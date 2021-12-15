#!/bin/bash
#IP=$1

echo "**************************************************"
echo "                  Clean MTR client                "
echo "**************************************************"
ip=$1

#if [ -z "$ip" ]
#then
#       echo "Please specify a valid IPv4 address"
#       exit
#fi

function IP-Validation()
{
    local  ip=$1
    local  stat=1

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
            && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi
    return $stat
}

#if [[ "$(basename $0 .sh)" == 'clean_mtr' ]]; then
#           ips='
#               4.2.2.2
#               a.b.c.d
#               192.168.1.1
#               0.0.0.0
#               255.255.255.255
#               255.255.255.256
#               192.168.0.1
#               192.168.0
#               1234.123.123.123
#               '


for ip in $ip
                do
                        if IP-Validation $ip
                        then stat='good'
                                else stat="Invalid <IP ADDR>, Please provide a valid IP address instead."
                                echo "Please provide a valid <IP.ADD.RE.SS>"
                                exit
                        fi
                        printf "%-20s: %s\n" "$ip" "$stat"
                done
#fi

mtr --no-dns --mpls --order "LDRS BAWV MJX" -4 $1

echo "Thank you for using the Clean MTR client"

echo "Have a nice day"
