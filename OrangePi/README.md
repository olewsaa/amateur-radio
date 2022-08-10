# Orange Pi 4
## Introduction
Orange Pi is a set of small Raspberry Pi like single board
computers. While similar to RPi it's not directly compatible. It comes
with a different ARM processor, but still binary compativle
(AFAIK). The OS for the 4 variant is 64 bit with less support fro 32
bit alternatives. Both Ubuntu and Debian (plus some more like Armbian,
Android etc are supported).

The build system for 64 bit is working as expected and most codes just
compile just out of the box. Some libraries and extras are not
installed by default, but apt search and install fix all of
these. Common applictions like flrig, fldigi, hamlib, ardopc etc build
without issues.

## flrig, fldigi, hamlib
The following packages need to be installed to build the programs:
```build-essential libfltk1.1-dev:arm64 libfltk1.3:arm64 libfltk-cairo1.3:arm64 libfltk-forms1.3:arm64 libfltk-gl1.3:arm64 libfltk-images1.3:arm64 libfltk1.3-dev:arm64 libudev-dev:arm64 libpng-dev:arm64 libsamplerate0-dev:arm64 libogg-dev:arm64 libflac-dev:arm64 libvorbis-dev:arm64 libsndfile1-dev:arm64 libjack0:arm64 libasound2-dev:arm64 libjack-dev:arm64 libportaudio2:arm64 libportaudiocpp0:arm64 portaudio19-dev:arm64``` 



## pat
There is a 64 bit build of pat at: https://harenber.web.cern.ch/harenber/pat_0.12.1_arm64.deb
This install nicely under Ubuntu on the Orange Pi 4.






