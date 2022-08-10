# Orange Pi 4
## Introduction
Orange Pi is a set of small Raspberry Pi like single board
computers. While similar to RPi it's not directly compatible. It comes
with a different ARM processor, but still binary compatible
(AFAIK). The OS for the 4 variant is 64 bit with less support fro 32
bit alternatives. Both Ubuntu and Debian (plus some more like Armbian,
Android etc are supported).

The build system for 64 bit is working as expected and most codes just
compile just out of the box. Some libraries and extras are not
installed by default, but apt search and install fix all of
these. Common applications like flrig, fldigi, hamlib, ardopc etc build
without issues.

## flrig, fldigi, hamlib
The following packages need to be installed to build the programs:
```build-essential libfltk1.1-dev:arm64 libfltk1.3:arm64 libfltk-cairo1.3:arm64 libfltk-forms1.3:arm64 libfltk-gl1.3:arm64 libfltk-images1.3:arm64 libfltk1.3-dev:arm64 libudev-dev:arm64 libpng-dev:arm64 libsamplerate0-dev:arm64 libogg-dev:arm64 libflac-dev:arm64 libvorbis-dev:arm64 libsndfile1-dev:arm64 libjack0:arm64 libasound2-dev:arm64 libjack-dev:arm64 libportaudio2:arm64 libportaudiocpp0:arm64 portaudio19-dev:arm64``` 

Instructions to build are given by the different packages, but
generally ./configure, make and make install.

## ARDOP 
The ARDOP sources are available and contained in a zip archive:
https://www.cantab.net/users/john.wiseman/Downloads/Beta/TeensyProjects.zip
.  There are several ARDOP variants, I used ARDOPC. There is a
makefile and issuing this built the ARDOPC without issues. It runs and
display different audio devices. Testing remain to validate the
correctness of the build.


## pat
There is a 64 bit build of pat at: https://harenber.web.cern.ch/harenber/pat_0.12.1_arm64.deb
This install nicely under Ubuntu on the Orange Pi 4. It runs and seems to be working OK, but validation is pending.

## VARA
VARA is another issue. As the Orange Pi 4 is a 64 bit system and the
Orange Pi maker insist on running a 64 bit OS the support for 32 bit
build support is rather limited. Box86 build but running applications
run into trouble. Likewise trying to run Wine also encounter issues. 

It's clear that getting VARA to run require some effort.










