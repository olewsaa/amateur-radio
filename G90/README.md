# Update Xiegu G90 Firmware 

## Introduction
The Xiegu G90 is a popular transceiver used by amateur radio operators for
communication purposes. Over time, the manufacturer of the G90 may
release new updates to the firmware of the device, which can provide
additional features or improve existing ones. Upgrading the firmware
of the G90 is a straightforward process that can be done by following
a few simple steps.

This how-to show how to upgrade the firmware using Linux on both AMD64 
and ARM64 (OrangePi 4) based systems.

Check for firmware updated at the [Xiegu EU site](https://xiegu.eu/downloads/)
under the section «G90 Firmware, Manuals & Utils».

## Download g90updatefw
The g90updatefw is written in go.
If the [golang](https://go.dev/) compiler it not installed install using: 
```
apt install golang
```

g90updatefw is a utility written by Dale Farnsworth, all source are found at the 
[github repo](https://github.com/DaleFarnsworth). You need to download 
(download zip file or clone repo):
* g90updatefw
* go-xmodem
* term

If you chose to download the zip files, a rename to is recommended to remove 
the master suffix.


## Build the application g90updatefw
Some steps need by done to successfully build the application. A step by step
guide is is found in Install-g90updatefw in this repo.


## Update the firmware

Example is shown for 1.79b03 version, the firmware files have the extension xgf.

### Display unit
Unplug radio from power, plug power back and
issue the following command :
```
./linux/amd64/g90updatefw G90_DispUnit_Fw_V1.79b03.xgf /dev/ttyUSB0
```
Note: 
The port is often /dev/ttyUSB0, but check which port that shows up when 
plugging the cable into the computer, it can be USB1 or even a higher number. 

When upgrading the display units you need to hold in the volume button
while pressing power on. It should trigger a text on the computer,
about erasing and copying new firmware.

### Main unit
Unplug and re-plug power, no need to hold volume button. 
Issue the following command :
```
./linux/amd64/g90updatefw G90_MainUnit_Fw_V1.79b03.xgf /dev/ttyUSB0
```
It should emit messages about erasing and copying of the new firmware.

Have fun / 73


