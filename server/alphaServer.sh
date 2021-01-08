#!/bin/bash

while true
do
    (echo $(echo "nodeABC has "; if [ -e /root/nodeABC.log ]; then grep -o -i "failed\|accepted" /root/nodeABC.log | wc -l; else echo "0"; fi; echo " attempt(s)")) > /home/monitor.log
    sleep 1
done