# Winlink on x86-64 running Linux

## Introduction
The Winlink and VARA software are written for the Windows operating system
and compiled for the x86 architecture. The Winlink itself is a 32-bit program.
However in both Windows and Linux 32-bit programs run fine on a 64-bit OS 
installation.
```
file Winlink_Express_install.exe 
Winlink_Express_install.exe: PE32 executable (GUI) Intel 80386, for MS Windows
```
The widely used software modem VARA is likewise also a 32-bit application.
```
file VARA\ setup\ \(Run\ as\ Administrator\).exe 
VARA setup (Run as Administrator).exe: PE32 executable (GUI) Intel 80386, for MS Windows
```
As these 32-bit applications are run using Wine some settings are needed to 
accommodate this. When both Windows and Linux got upgraded to 64-bit architectures 
the 32-bit comp ability were ensured and exist to this day.



## Laptop for Q900 
While I use a [Q900](https://www.guohedz.com/Q900#) transceiver most
of the installation of Winlink and VARA are identical for any kind of
transceiver. It's only a few configuration steps in Winlink that
differ from transceiver to transceiver.

Using a Linux based laptop (with x86-64 processor) with Winlink and
VARA is relatively straightforward. Even if the Winlink and VARA
software are Windows based and 32-bit it can be run with some 
compatibility software.

As the Q900 transceiver has a built in soundcard and uses a common USB
cable for both CAT and audio there is little need for a standalone
dedicated computer. Built in audio card is a plus for this radio. 


## Installing Wine, Winlink and VARA HF & FM
As Winlink and VARA are software running under Windows it need
a software platform to run on. Here's the Wine elevator pitch:
_"Wine (originally an acronym for "Wine Is Not an Emulator") is a
compatibility layer capable of running Windows applications on several
POSIX-compliant operating systems, such as Linux, macOS, &
BSD. Instead of simulating internal Windows logic like a virtual
machine or emulator, Wine translates Windows API calls into POSIX
calls on-the-fly, eliminating the performance and memory penalties of
other methods and allowing you to cleanly integrate Windows
applications into your desktop."_

In order to run Winlink and VARA the well known and well established
windows compatibility layer software [Wine](https://www.winehq.org/)
is needed.  While a mature piece of software (at the time of writing
the latest is version 9) it's slightly tedious to install.  Wine is
available with the current Linux distributions and only require
packages to install, in addition some extras and some configurations.

The Q900 has a frequency range from 100 kHz to 2 GHz receive and from
1.8 to 434 MHz covering 160 m to 70 cm. Hence it support VARA FM 
at 2 m and 70 cm. I have never tried 6m and 4m (I have no antenna).


### Step by step cut'n paste
As the installation is only done once or very few doing it manually by cut-n-paste 
make sense here. Any errors or warnings can be dealt with immediately. 
A script would make perfect sense if this processes would be repeated, 
but we live in a dynamic world where versions change quite often. Even this
manual procedure break from time to time. 

The file [Install-VARA-AMD64.md](https://github.com/olewsaa/amateur-radio/blob/main/Winlink-Linux-amd64/Install-VARA-AMD64.md) 
contain a step by step installation instructions for manual assisted 
installation. This can used for a full control manual installations, 
just cut'n paste the commands and review each step. Some images of Wine 
(Windows programs) popups are included, but it's fairly evident what to click.







