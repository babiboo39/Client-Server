#!/bin/bash

while true
do
    (echo $(if [ -e /root/nodeABC.log ]; then grep -o -i "failed password\|accepted password" /root/nodeABC.log | wc -l; else echo "0"; fi; echo " ssh log-in attempts were made at nodeABC")
    echo $(if [ -e /root/nodeABC.log ]; then grep -o -i "failed password\|accepted password" /root/nodeXYZ.log | wc -l; else echo "0"; fi; echo " ssh log-in attempts were made at nodeXYZ")) > /home/monitor.log
    sleep 1
done