# Amateur-radio
## Introduction
Code related to ham amateur radio using small single board computers
like Raspberry Pi and Orange Pis. Centered around digital modes and in
particular Winlink email using pat.

The Q900 radio is installed onboard Algol and as it have built in soundcard and
can connect with a single USB cable I have connected it directly to the laptop.
Simplicity is important when operating from a sailboat on battery power. The Q900
cover the from 160 m to 70 cm which is ideal when space is limited. 

The G90 is installed at home with a random wire antenna extending from a 
window to an apple tree. Not great, but FT8 and winlink work.  

### DMR
Programming the radios in a all Linux environment is slightly more tedious than
using a Windows environmemt. A shortcut is Win10 virtual machine using VirtualBox
(this works surpringly well BTW, including USB). 
However, it's better to use Linux tools. One option is Wine that allow some 
Windows programs to run under Linux, like the graphical «TYT Code Plug Editor» 
which is very user friendly tool. 

I have collected a set of tools that makes it possible to program the radio using 
an all Linux environment. 


### NanoVNA software
The directory NanoVNA contain Python script to plot Z and SWR from a
.s1p file.  The nanovna-saver is a nice piece of software, but the
plotting is not it's stongest side. However, a Python script for a Smith diagram 
is pending. 

### Pat for Raspberry Pi
The directory pat contain files and instructions for installing and using pat 
(and Winlink) for email using Raspberry Pi 4. This is currently running nicely 
at home. Connect with VNC from several computers.  

### Issues with position and grid when on the move
Onboard SignalK is used for communication between devices. Position
and time is available using a http request. This can then be used to
update the init files for pat and for WSJT-X and JS8Call as well as
setting the date and time on the system that run the ham radio
software. Unfortunately the init files are read when the program is
launched, it will not update later. If you move and keep the programs
running the current grid position and the position used by the
programs might differ.

I have put the Python scrips for this in the directory named 
[on-the-move](https://github.com/olewsaa/amateur-radio/blob/main/on-the-move).


### Alternative to Raspberry Pi 
The directory OrangePi contain files and information regarding 
using Orange Pi single board computers as alternative to Raspberry Pi.
See [Orange homepage](http://www.orangepi.org/) for detailed information.
The range of offerings are far greater then with Raspberry and supply is
not an issue. 

As Raspberry Pi 4 is hard to come by these days evaluating the
alternative 
[Orange Pi 4](http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/orange-pi-4-LTS.html) is ongoing. The Orange Pi 4 is a 
good alternative.  It comes with a faster processor build in 16 GiB 
[eMMC](https://en.wikipedia.org/wiki/MultiMediaCard#eMMC) 
memory for OS, no need for a memory card after the initial installation. 
The Orange Pi 4 might be overkill, there are smaller boards like Orange Pi 3 or
even smaller that should be powerful enough to run the pat and radio software. 
The only issue is VARA with its x86 emulation and Wine for windows 
environment, which is a bit demanding. 


## Upgrading the G90 firmware 
I have included some instructions to explain and document how to 
upgrade the G90's firmware using a Pi or a x86-64 based PC running Linux.
Script and explanations are found in the G90 directory.



