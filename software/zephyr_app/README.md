# Instructions

## Setup the container
```
./setup.sh
```

## Install the udev rules
```
sudo cp rules/60-openocd.rules /etc/udev/rules.d
sudo udevadm control --reload
```

## Build blinky
```
west build -b stm32_min_dev_blue samples/basic/blinky
```

## Flash the firmware
**IMPORTANT!**
The docker container doesn't detect hotplug events for USB, so the st-link
should be in the USB port before starting the container.

```
west flash
```
