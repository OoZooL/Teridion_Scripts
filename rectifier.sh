#!/bin/bash

systemctl status tcrd | grep "systemctl daemon-reload"
if [ $? -ne 0 ]
        then systemctl daemon-reload
 
fi

systemctl status tcrd | grep "active (exited)"
if [ $? -eq 0 ]
        then systemctl restart tcrd
else echo "All is well"
fi

NTPD_State=$(systemctl status ntpd | wc -l)
if [ $NTPD_State -gt 10 ]
		then echo "NTPD service is running as expected"
else systemctl restart ntpd && echo "NTPD restarted due to improper function"
fi


systemctl status tcrd | grep "systemctl daemon-reload" ; if [ $? -ne 0 ] ; then systemctl daemon-reload ; else echo "Daemon reload is not necessary here" ; fi ; systemctl status tcrd | grep "active (exited)" ; if [ $? -eq 0 ] ; then systemctl restart tcrd ; else echo "All is well" ; fi ; NTPD_State=$(systemctl status ntpd | wc -l) ; if [ $NTPD_State -gt 10 ] ; then echo "NTPD service is running as expected" ; else systemctl restart ntpd && echo "NTPD restarted due to improper function" ; fi