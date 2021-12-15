#!/bin/bash
ExhibitA="/var/log/tcr/tcrconfig.log"
ExhibitB="/var/log/tcr/tcrd.log"
ExhibitC="/var/log/tcr/tcr_ha_agent.log"
ExhibitD="/var/log/tcr/tcr.log"
ExhibitE="/var/log/tcr/tcr_monitor.log"
ExhibitF="/var/log/tcr/wanproxy/wanproxy.log"
ExhibitG="/var/log/tcr/watchdog.log"

#function isinstalled {
#  if yum list installed "iperf" >/dev/null 2>&1; then
#    true
#  else
#    rpm -ihv ftp://fr2.rpmfind.net/linux/dag/redhat/el6/en/x86_64/dag/RPMS/iperf-2.0.4-1.el6.rf.x86_64.rpm
#  fi
#}

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

function while_read_loop_crit {
cat $ExhibitA  $ExhibitB $ExhibitC $ExhibitD $ExhibitE $ExhibitF $ExhibitG | \
while read line ; do
        echo "$line" | grep -i "crit"
        if [ $? = 0 ]
        then
                echo "$line" >> "fcew_$(date +%d-%m-%y-%H-%M).log"
        fi
done
}

function while_read_loop_error {
cat $ExhibitA  $ExhibitB $ExhibitC $ExhibitD $ExhibitE $ExhibitF $ExhibitG | \
while read line ; do
        echo "$line" | grep -i "err"
        if [ $? = 0 ]
        then
                echo "$line" >> "fcew_$(date +%d-%m-%y-%H-%M).log"
        fi
done
}

function while_read_loop_warn {
cat $ExhibitA  $ExhibitB $ExhibitC $ExhibitD $ExhibitE $ExhibitF $ExhibitG | \
while read line ; do
        echo "$line" | grep -i "warn"
        if [ $? = 0 ]
        then
                echo "$line" >> "fcew_$(date +%d-%m-%y-%H-%M).log"
        fi
done
}
#done #< <(tail -F $ExhibitA) # $ExhibitB $ExhibitC $ExhibitD $ExhibitE $ExhibitF $ExhibitG)
#}
#echo "Hello dude"
#function while_read_loop_crit {
#tail -F $ExhibitA  $ExhibitB $ExhibitC $ExhibitD $ExhibitE $ExhibitF $ExhibitG | \
#while read line ; do
#       echo "$line" | grep -i "crit"
#       if [ $? = 0 ]
#       then
#               echo $line >> "crit.log"
#       fi
#done #< <(tail -F $ExhibitA) #$ExhibitB $ExhibitC $ExhibitD $ExhibitE $ExhibitF $ExhibitG)
#}

#function while_read_loop_fatal {
#tail -F $ExhibitA  $ExhibitB $ExhibitC $ExhibitD $ExhibitE $ExhibitF $ExhibitG | \
#while read line ; do
#       echo "$line" | grep -i "fatal"
#       if [ $? = 0 ]
#       then
#               echo $line >> "fatal.log"
#       fi
#done #< <(tail -F $ExhibitA) # $ExhibitB $ExhibitC $ExhibitD $ExhibitE $ExhibitF $ExhibitG)
#}

#function while_read_loop_warn {
#tail -F $ExhibitA  $ExhibitB $ExhibitC $ExhibitD $ExhibitE $ExhibitF $ExhibitG | \
#while read line ; do
#       echo "$line" | grep -i "warn"
#       if [ $? = 0 ]
#       then
#               echo $line >> "warn.log"
#       fi
#done #< <(tail -F $ExhibitA) # $ExhibitB $ExhibitC $ExhibitD $ExhibitE $ExhibitF $ExhibitG)
#}

while_read_loop_fatal #$ExhibitB $ExhibitC $ExhibitD $ExhibitE $ExhibitF $ExhibitG
while_read_loop_crit #$ExhibitB $ExhibitC $ExhibitD $ExhibitE $ExhibitF $ExhibitG
while_read_loop_error #$ExhibitB $ExhibitC $ExhibitD $ExhibitE $ExhibitF $ExhibitG
while_read_loop_warn #$ExhibitB $ExhibitC $ExhibitD $ExhibitE $ExhibitF $ExhibitG
