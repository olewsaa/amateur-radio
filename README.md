# amateur-radio
## Introduction
Code related to ham amateur radio using small single board computers
like Raspberry Pi and Orange Pis. Centred around digital modes and in
particular Winlink email using pat.

### Pat for Raspberry Pi
The directory pat contain files and instructions for installing and using pat 
(and Winlink) for email using Raspberry Pi 4. This is currently running nicely 
onboard Algol. 

### Issues with position and grid
Onboard SignalK is used for communication between devices. Position and time is available using a 
http request. This can then be used to update the init files for 
[pat](https://github.com/olewsaa/amateur-radio/blob/main/pat/update.pos.pat.conf.py) and for
[WSJT-X and JS8Call](https://github.com/olewsaa/amateur-radio/blob/main/pat/update.pos.WSJT-X.conf.py) 
as well as setting the date and 
[time on the system](https://github.com/olewsaa/amateur-radio/blob/main/pat/set-date-from-SignalK.py) 
that run the ham radio software. 

### Alternative to Raspberry Pi 
The directory OrangePi contain files and information regarding 
using Orange Pi single board computers as alternative to Raspberry Pi.
See [Orange homepage](http://www.orangepi.org/) for detailed information.
The range of offerings are far greater then with Raspberry and supply is
not an issue. 

As Raspberry Pi 4 is hard to come by these days evaluating the
alternative [Orange Pi 4](http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/orange-pi-4-LTS.html) is ongoing. The Orange Pi 4 is a 
good alternative.  It comes with a faster processor build in 16 GiB 
[eMMC](https://en.wikipedia.org/wiki/MultiMediaCard#eMMC) 
memory for OS, no need for a memory card after the initial installation. 
The Orange Pi 4 might be overkill, there are smaller boards like Orange Pi 3 or
even smaller that should be powerful enough to run the pat and radio software. 
The only issue is VARA with its x86 emulation and Wine for windows 
environment, which is a bit demanding. 



