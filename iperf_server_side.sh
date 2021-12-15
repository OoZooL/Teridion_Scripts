#!/bin/bash

echo "***********************************************************"
echo "                  iPerf Server Side                        "
echo "***********************************************************"

function isinstalled {
  if yum list installed "iperf3" >/dev/null 2>&1; then
    true && echo "All is well"
  else
    yum install -y iperf3 && echo "installed iperf3"
  fi
}

isinstalled

iptables -I INPUT 1 -p tcp --dport 5678 -j ACCEPT

iperf3 -s -p 5678 -i 5

iptables -D INPUT 1
