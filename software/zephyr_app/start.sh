#!/usr/bin/bash

set -e

if [[ ! -z $(lsusb | grep "STMicroelectronics ST-LINK/V2") ]]; then
    docker container start zephyr
    docker container attach zephyr
else
    echo "Please connect the ST-LINK/V2 before starting the container"
fi
