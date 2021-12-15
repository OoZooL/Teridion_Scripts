#!/bin/bash

echo "********** GT script - take one ****************"
echo "* * * Please specify your desired hostname * * *"
echo "************************************************"

host=$1

#function IP-Validation()
#{
#    local  ip=$1
#    local  stat=1
#
#    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
#        OIFS=$IFS
#        IFS='.'
#        ip=($ip)
#        IFS=$OIFS
#        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
#            && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
#        stat=$?
#    fi
#    return $stat
#}

if [ -z "$host" ]
then
        echo "Please specify a host, alternatively one may just cat /etc/hosts and find the necessary host(s) which are relevant..."
        exit
fi

cat /etc/hosts | grep $1
if [ $? -ne 0 ]
        then echo "Specified host does not exist, please try using a different host"
else
        ssh $1
fi

#IP-Validation $1
#if [ $? -ne 0 ]
#       then ssh $1
#else echo "Invalid IP or hostname"
#fi
