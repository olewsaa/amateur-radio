# DMR

## Introduction

Disclaimer: The code plug is manually written and there is a fair chance of
errors. Trust, but verify. 

My radio is a [Baofeng 1701](https://www.baofengradio.com/).
So far I'm very happy with the radio, no issues found so far. 

My codeplug (*.rdt) file is 
[available](https://github.com/olewsaa/amateur-radio/blob/main/DMR/BF1701-example-codeplug.rdt) 
(with personal info removed). 

### Edit codeplug using Wine/Virtual machine

To edit the code plug I use the 
[TYT Code plug editor](https://www.miklor.com/DMR/DMR-380-CPEditor.php),
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
correct mapping of the USB devices it works with no issues.

### Edit codeplug using Linux

#### qdmr
The utility [qdmr](https://dm3mat.darc.de/qdmr/) can be used to edit the 
codeplug under Linux. This is major advantage, no need for wine or VirtualBox
(using a Windows 10 virtual machine).

The software is available in some distributions,
like Ubuntu (and hence Mint). However, to get the most recent version
building from scratch is needed. The 
[code is on gihub](https://github.com/hmatuschek/qdmr) 
with installation [instructions](https://dm3mat.darc.de/qdmr/install.html).
Read the instructions to set up the build environment before starting cmake.

The syntax with qdmr differ from the two above. This is a major issue, but
the export import from and and the DMR CPE mentioned above is a major
issue. The qdmr uses an ascii format making it easy to move code plugs 
from one radio to another.

The qdmr software is still in it's early stages with some feeatures still 
missing for some radions, like BF-1701. Export and import is still not where
files from one program to another could be exchanged. 

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

