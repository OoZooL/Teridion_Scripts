#!/bin/bash

echo "**************************************************"
echo "                  iPerf Client Side               "
echo "**************************************************"

Server_IP=$1
Server_Port=$2
Interval=$3
Parallel_Sessions=$4
Time_To_Run=$5

echo "Please specify on the command line the following parameters following
the script name: Server IP, Server Listening Port (default is 5678), Interval
of updates to display on-screen, Parrallel sessions to run over tcp, and Time
to run the test client-side wise."

function isinstalled {
  if yum list installed "iperf3" >/dev/null 2>&1; then
    true && echo "All is well"
  else
    yum install -y iperf3 && echo "installed iperf3"
  fi
}

isinstalled


if [ -z "$Server_IP" ]
then
        echo "Please specify Server's IP"
        exit
fi

if [ -z "$Server_Port" ]
then
        echo "Please specify Server's Port"
        exit
fi

if [ -z "$Interval" ]
then
        echo "Please specify Interval for display updates"
        exit
fi

if [ -z "$Parallel_Sessions" ]
then
        echo "Please specify concurrent Sessions to run over TCP"
        exit
fi


if [ -z "$Time_To_Run" ]
then
        echo "Please specify Time to run the test"
        exit
fi

iperf3 -c "$1" -p "$2" -i "$3" -P "$4" -t "$5"

echo "The last line of output is a summary, all the previous lines are display
intervals and refer to the window of time in referrence."

