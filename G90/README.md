# Update Firmware G90

## Introduction
The G90 is a popular transceiver used by amateur radio operators for
communication purposes. Over time, the manufacturer of the G90 may
release new updates to the firmware of the device, which can provide
additional features or improve existing ones. Upgrading the firmware
of the G90 is a straightforward process that can be done by following
a few simple steps.

Check for firmware updated at the (https://xiegu.eu/downloads/)[Xiegu EU site]
under the section «G90 Firmware, Manuals & Utils».

This how-to show how to upgrade the firmware using Linux on both AMD64 
and ARM64 (OrangePi 4) based systems.

## Download g90updatefw
This is a utility written by Dale Farnsworth, all source are found at the 
[github repo](https://github.com/DaleFarnsworth). You need to download 
(download zip file og clone repo):
* g90updatefw
* go-xmodem
* term

If the [golang](https://go.dev/) compiler is not installed install using: 
´´´apt install golang´´´.

## Build the application g90updatefw
Some steps need by done to successfully build the application. A step by step
guide is is found in Install-g90updatefw in this repo.


## Update the firmware

Example is shown for 1.79b03 version.

### Dislay unit
Uplug radio from power, plug power back and
issue the following command :
```
./linux/amd64/g90updatefw G90_DispUnit_Fw_V1.79b03.xgf /dev/ttyUSB0
```
Note: 
The port is often /dev/ttyUSB0, but check which port that shows uop when 
plugging the cable into the computer, it can be USB1 or even a higher number. 

When upgrading the display units you need to hold in the volume button
while pressing power on. It should trigger a text on the computer,
about erasing and copying new firware.

### Main unit
Unplug and replug power, no need to hold volume button. 
Issue the following command :
```
./linux/amd64/g90updatefw G90_MainUnit_Fw_V1.79b03.xgf /dev/ttyUSB0
```
It should emit messages about erasing and copying of the new firmware.

Have fun.

