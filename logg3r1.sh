#!/bin/bash
ExhibitA="/var/log/tcr/tcrconfig.log"
ExhibitB="/var/log/tcr/tcrd.log"
ExhibitC="/var/log/tcr/tcr_ha_agent.log"
ExhibitD="/var/log/tcr/tcr.log"
ExhibitE="/var/log/tcr/tcr_monitor.log"
ExhibitF="/var/log/tcr/wanproxy/wanproxy.log"
ExhibitG="/var/log/tcr/watchdog.log"

function while_read_loop_fatal {
cat $ExhibitA  $ExhibitB $ExhibitC $ExhibitD $ExhibitE $ExhibitF $ExhibitG | \
while read line ; do
        echo "$line" | grep -i "fatal"
        if [ $? = 0 ]
        then
                echo $line >> "fcew_$(date +%d-%m-%y-%H-%M).log"
        fi
done
}

while_read_loop_fatal
