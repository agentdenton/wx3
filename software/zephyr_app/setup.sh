#!/usr/bin/bash

set -e

CONTAINER_NAME="zephyr"
CONTAINER_TAG="zephyr-builder"

if [[ ! -z $(docker container ps -a | grep "$CONTAINER_NAME"$) ]]; then
    echo "The $CONTAINER_NAME container already exists!"
    exit 1
fi

TARGET_USERNAME="wx3"

APP_PATH_HOST="$HOME/development/wx3/v0.1/software/zephyr_app"
APP_PATH_TARGET="/home/$TARGET_USERNAME/zephyrproject/app"

docker build -t $CONTAINER_TAG --build-arg USERNAME=$TARGET_USERNAME .
docker create -it --privileged \
 -v $APP_PATH_HOST:$APP_PATH_TARGET \
 -v /dev/bui/usb:/dev/bus/usb \
 --network host \
 --name=$CONTAINER_NAME zephyr-builder
