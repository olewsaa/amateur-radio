# DMR

## Introduction

Disclaimer: My code plugs are manually written and there is a fair chance of
errors. Most of the analog and digital repeaters have been tested. 

My radio is a [Baofeng 1701](https://www.baofengradio.com/).
So far I'm very happy with the radio, no issues found so far. 

### Script to generate a codeplug config file for dmrconfig 
The wish to have an all Linux envirnment made me start using the command line 
tool[dmrconfig](https://github.com/OpenRTX/dmrconfig). This have support for 
a fair share of radios. Being a command line tool means that the application
works with text config files. This si an easy, but can be tedious to enter or
even copy paste can be boring enough. The make is less tedious I decided to write
a script that have a few relatively simple input files containing the bare minimum 
of information. Using these few small and simple input files as input the script
generate a dmr.conf file that can be written directly to the radio using dmrconfig.

I have written a [script to generate a code plug configuration](make.codeplug.md) file 
for [dmrconfig](https://github.com/OpenRTX/dmrconfig) making it a fairly simple process or 
generating a code plug from scratch. In some ways text files are simpler than spreadsheet
interface. 

### My codeplug for BF1701 (binary)
My codeplug (*.rdt) file is 
[available](https://github.com/olewsaa/amateur-radio/blob/main/DMR/BF1701-example-codeplug.rdt) 
(with personal info removed). 


## Edit codeplug using Linux

### qdmr
The utility [qdmr](https://dm3mat.darc.de/qdmr/) can be used to edit the 
codeplug under Linux. This is major advantage, no need for Wine or VirtualBox
(using a Windows 10 virtual machine). The software is still under active
development which is very good signal. 

The software is available in some distributions,
like Ubuntu (including Mint). However, to get the most recent version
building from scratch is needed. The 
[code is on gihub](https://github.com/hmatuschek/qdmr) 
with installation [instructions](https://dm3mat.darc.de/qdmr/install.html).
Read the instructions to set up the build environment before starting cmake.

The qdmr software is still in it's early stages with some features still 
missing for some radios, like BF-1701. However, it works well enough to
fulfill what's needed. 

It still misses capabilities to program the buttons, this can be done
with the official code plug editor and we below how to deal with Windows 
software.

### dmrconfig 
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

### Generating a code plug using script and very simple input files

I wrote the code plug from scratch, both to learn how it works
and also to have full control. There is a high probability that I
missed something. However, it works as expected (more or less).

As I found the editing process boring and tedious I wrote a bash script
that take some inout files that contain the bare minimum of information
needed. As much as possible is left as defaults. 

The memory only have room for 10k digital contacts so only a few 
can be stored. Normally the *last heard* are loaded and updated.

The script as it's own page [make.codeplug](make.codeplug.md). Some background and
how to use. 


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

However, to get access to the USB port with Linux you must either use
Virtual Box (or another virtual machine platform) to run the windows
software. Using VirtualBox running Win10 and with the correct mapping
of the USB devices it works with no issues (selecting the correct USB
device in the setting for the VM).

Unfortunately wine do not take control over the USB ports as a Virtual
Machine.  Wine is an emulator that allow Windows programs to be run
under Linux, it do not offer the same degree of control over the
complete system line a virtualisation platform.

