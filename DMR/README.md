# DMR

## Introduction

Disclaimer: The code plug is manually written and there is a fair chance of
errors. Trust, but verify. 

My radio is a [Baofeng 1701](https://www.baofengradio.com/).
So far I'm very happy with the radio, no issues found so far. 

My codeplug (*.rdt) file is 
[available](https://github.com/olewsaa/amateur-radio/blob/main/DMR/BF1701-example-codeplug.rdt) 
(with personal info removed). 

### Edit codeplug using Linux

#### qdmr
The utility [qdmr](https://dm3mat.darc.de/qdmr/) can be used to edit the 
codeplug under Linux. This is major advantage, no need for Wine or VirtualBox
(using a Windows 10 virtual machine). The software is still under activce
development which is very good signal. 

The software is available in some distributions,
like Ubuntu (and hence Mint). However, to get the most recent version
building from scratch is needed. The 
[code is on gihub](https://github.com/hmatuschek/qdmr) 
with installation [instructions](https://dm3mat.darc.de/qdmr/install.html).
Read the instructions to set up the build environment before starting cmake.

The qdmr software is still in it's early stages with some feeatures still 
missing for some radios, like BF-1701. However, it works well enough to
fulfill what's needed. 

It still misses capabilities to program the buttons, this can be done
with the official code plug editor and we below how to deal with Windows 
software.

#### dmrconfig 
The project [dmrconfig](https://github.com/OpenRTX/dmrconfig) is another
utility for programming the radio under Linux. While not a GUI program like
the others it offers a text based input which is easy to share with others. 
While the source code is on git and available, the Make file is not fully 
correct. There are a some missing libraries. The BSD libraries are not
included in the prerequisites. I have made an updated 
[Makefile](https://github.com/olewsaa/amateur-radio/blob/main/DMR/Makefile.dmrconfig) 
which contain the needed information to build dmrconfig.
Very small changes *"apt-get install libbsd libbsd-dev"* and 
*"-lbsd"* in the link library line. The function *strnstr* is only found the in
the BSD library. 

A codeplug 
[text config file](https://github.com/olewsaa/amateur-radio/blob/main/DMR/device.BF1701.conf) 
is available as an example. 

This software is a command line tool. The actual configuration code must
be entered in a text editor or copied from a binary code plug file, a .rtd file.
As the GUI codeplug editor works nicely under wine I use this for much of
the programming. Then dmrconfig to copy it to the radio. All done using 
Linux (Linux Mint). 

The [wiki page](https://github.com/OpenRTX/dmrconfig/wiki) 
for dmrconfig contain a lot of information about usage 
of dmiconfig. 

I have not verified that the button programming can be done using dmrconfig 
device script. The buttons were programmed using the official CPE and VirtualBox Win10.

### Mapping, names and geolocation by name

I wrote the code plug from scratch, both to learn how it works
and also to have full control. There is a high probability that I
missed something. However, it works as expected (more or less).

I have used zones for different regions. Then a two letter code for the
individual locations. I use names instead of call signs since it 
generally easier to remember names than call signs. 

The memory only have room for 10k digital contacts so only a few 
can be stored. Normally the *last heard* are loaded and updated.

The file 'BF1701-example-codeplug.rdt' is an anonymous version of
my latest code plug file. 



### Edit codeplug using Wine/Virtual machine

To edit the code plug I use the 
[TYT Code plug editor](https://www.miklor.com/DMR/DMR-380-CPEditor.php) (CPE),
with a [download link](https://www.miklor.com/DMR/software/DMR_CPE.1.1.21.zip).


The download section on the Baofeng web pages contain software for multiple 
radios, including the 
[Baofeng 1701](https://www.baofengradio.com/pages/download).

The official [code plug editor(CPE)](https://baofeng.s3.amazonaws.com/Baofeng_DM-1701_CPS_1.05.zip)
is used to write the data to the radio as the TYT codeplug editor do
not support writing to the 1701. In addition the buttons need to
programmed using the official CPE. 

Unfortunately the software only run under windows. 
Both of the CPEs run fine using [wine](https://www.winehq.org/).

However, to get access to the USB port with Linux you must
either use Virtual Box (or another virtual machine platform) to run
the windows software. Using VirtualBox running Win10 and with the
correct mapping  of the USB 
devices it works with no issues (selecting the correct USB device in the setting for the VM). 


