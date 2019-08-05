#!/bin/bash

case "$1" in
        start)
               docker run --rm -d --add-host pluto.local:192.168.11.1 --net host --name="gps-sdr-sim" gps-sdr-sim:1.0
               ;;
        stop)
               docker kill gps-sdr-sim
               ;;
        *)
               echo "usage: $0 {start}"
               ;;
esac
