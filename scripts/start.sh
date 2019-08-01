#!/bin/bash

mkfifo gpsstream

gps-sdr-sim -e ~/config/brdc3540.14n -l 50.059330, 0.008319,100 -T $(date -u +%Y/%m/%d,%H:%M:%S) -i -o gpsstream -d 31556926 &

sleep 5

plutoplayer -t gpsstream -b 3.0
