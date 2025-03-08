# DMR

## Introduction

My radio is a [Baofeng 1701](https://www.baofengradio.com/).


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

### Edit codeplug Linux

The utility [qdmr](https://dm3mat.darc.de/qdmr/) can be used to edit the 
codeplug under Linux. This is major advantage, no need for wine or VirtualBox
(using a Windows virtual machine).

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


### Mapping, names and geolocation

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

