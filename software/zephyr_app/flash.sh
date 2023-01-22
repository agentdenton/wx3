#!/usr/bin/bash

set -e

if [[ ! -z $(lsusb | grep -i "Arduino") ]]; then
    # echo "BOOT0: 1" > /dev/ttyACM0
    # west flash
    # echo "BOOT0: 0" > /dev/ttyACM0
else
    echo "The arduino is not connected"
fi
