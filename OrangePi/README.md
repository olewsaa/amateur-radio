# Orange Pi 4
* [Introduction](#Introduction)
* [VNC](#VNC)
* [Hamutils](#Hamutils)
* [ARDOP](#ARDOP)
* [pat](#pat)
* [VARA](#VARA)
* [WSJTX](#WSJTX)
* [JS8Call](#JS8Call)
* [Transfer to eMMC](#eMMC)

## Introduction
Orange Pi is a set of small Raspberry Pi like single board
computers. While similar to RPi it's not directly compatible. It comes
with a different ARM processor, but still binary compatible
(AFAIK). The OS for the 4 variant is 64 bit with less support for 32-bit alternatives. 
Both [Ubuntu and Debian](http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-pi-4.html) 
(plus some more like Armbian, Android etc are supported). I have selected 
[Ubuntu 22](https://drive.google.com/file/d/12C7mLMsiMOmClAoYMlWcZ5xnpRniBINq/view?usp=sharing), 
[OrangePi4](http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-pi-4-LTS.html).

The build system for 64 bit is working as expected and most codes just
compile just out of the box. Some libraries and extras are not
installed by default, but apt search and install fix all of
these. Common applications like flrig, fldigi, hamlib, ardopc etc build
without issues (VARA poses a challenge in the pure 64bit environment).

The file install-OrangePI4.txt provide a cut and paste installation 
script. It cannot be run as a script because it involved some manual
steps. These steps could be automated, but it's a one-time step.

My setup is using [OrangePi 4](http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/orange-pi-4-LTS.html) with
Ubuntu 22.04.1 LTS (Jammy Jellyfish).

An Orange Pi 3 LTS might be capable of running the software in question.
While flrig, fldigi, pat and ARDOP should run without issues with 4 cores and 2 GiB it
might be an issue for VARA. This remain to be tested. The Orange Pi 3 has a lower cost and 
lower power consumption and could be a lower cost alternative.

## VNC
While ssh and X11 works excellent, VNC is often used and in many cases an excellent
way of connecting. With Orange Pi some extra steps are needed. Both vncserver.users and vncserver@:1.servic are found in this repo.
```
   apt install tightvncserver
   mkdir /etc/tightvnc
   nano  /etc/tightvnc/vncserver.users
   cp vncserver@:1.service /etc/systemd/system/vncserver@:1.service
``` 
Set password for user, ```vncpasswd```.

Test with:
```systemctl start vncserver@:1 --now```
The server listen on port 5901, this might need to be added in the address giver in the client, in my case 192.168.0.172:5901. If everything works enable the service :
```systemctl enable vncserver@:1 --now```
I use the realVNC client which works fine with the tight VNC server. When using a 
laptop the resolution might not be optimal at 1920x1200, review the 
vncserver@:1.service file and update resolution as needed. 


## Hamutils
The utils flrig, fldigi, hamlib are needed to run the rig.

The following packages need to be installed to build the programs (the build-essential is normally already installed) :
```libfltk1.3 libfltk1.3-dev libudev-dev:arm64 libpng-dev:arm64 libsamplerate0-dev:arm64 libogg-dev:arm64 libflac-dev:arm64 libvorbis-dev:arm64 libsndfile1-dev:arm64 libjack0:arm64 libasound2-dev:arm64 libjack-dev:arm64 libportaudio2:arm64 libportaudiocpp0:arm64 portaudio19-dev:arm64``` 

* [hamlib](https://github.com/Hamlib/Hamlib/releases/download/4.5.4/hamlib-4.5.4.tar.gz)
* [flrig](http://www.w1hkj.com/files/flrig/flrig-1.4.7.tar.gz)
* [fldigi](http://www.w1hkj.com/files/fldigi/fldigi-4.1.25.tar.gz)


Instructions to build are given by the different packages, but
generally ./configure, make and make install.
Hamlib's rigctl can complain about missing library, libhamlib.so.4 or symbol(s), like lock_mode, debugmsgsave or others.
the library is installed at /usr/local/lib/, just run 
```sudo ldconfig /usr/local/lib/``` to fix it.



## ARDOP 
The ARDOP sources are available and contained in a [zip archive](https://www.cantab.net/users/john.wiseman/Downloads/Beta/TeensyProjects.zip). 
There are several ARDOP variants, I used ARDOPC (it's a bit unclear which 
version to use). I have made a [copy](https://github.com/olewsaa/amateur-radio/tree/main/OrangePi).

There is a makefile and issuing this makefile built the ARDOPC without 
issues under «focal» (20.04), but under «jammy» (22.04) you need to add the 
flag ```-fcommon```  to the CFLAGS.

It runs and display different audio devices so it should be working. 
I've included a pre build binary. Testing remain to validate the 
correctness of the build. Some more documentation should be prepared.


## pat
There is a [64 bit build of pat](https://github.com/la5nta/pat/releases/download/v0.13.1/pat_0.13.1_linux_arm64.deb).
This install nicely under Ubuntu on the Orange Pi 4. It runs and seems to be 
working OK, but validation is pending. Another option is to just clone
the git [repo](https://github.com/la5nta/pat) and build it locally. For more look at the
[RPi4 pat installation](https://github.com/olewsaa/amateur-radio/tree/main/pat).

## VARA
VARA is another issue. As the Orange Pi 4 is a 64 bit system and the
Orange Pi maker insist on running a 64 bit OS and the support for 32 bit
build support is rather limited.

Working with the author of the install script we are now very close to a solution.
The VARA HF and VARA FM install, start and run. Still not tested with a full pat and radio setup. 
Just download the script:

```
wget https://raw.githubusercontent.com/WheezyE/Winelink/main/install_winelink.sh
chmod +x install_winelink.sh
./install_winelink.sh vara_only
```
If you want everything just issue the script without the «vara_only». The installation take a fair amount of time
to complete.

With luck everything should work now and a workable alternative to Raspberry Pi 4 is possible.

## WSJTX
The WSJTX application can be installed using a 
[package file 64 bit](https://sourceforge.net/projects/wsjt/files/wsjtx-2.6.1/wsjtx_2.6.1_arm64.deb/download)

Some extra packages are needed. 

```
sudo apt install libboost-log1.74.0
sudo dpkg --install wsjtx_2.6.1_arm64.deb
sudo apt --fix-broken install
```
In some cases the audio interface selction are blank, this is caused by a missing package, this might help:

```apt install libqt5multimedia5-plugins```

After installing this package a long list of audio devices becomes available. The list is long and it might require some trial and error to find the correct device.  

WSJTX require a correct clock, on board Algol SignalK is available and [simple script](https://github.com/olewsaa/Yacht-computer/blob/master/pat/set-date-from-SignalK.py) will set the clock correctly if internet is not avaiable.

## JS8Call
Unfortunately the download [links](http://files.js8call.com/latest.html) (source code is also found here)
for JS8Call do not (at time of writing) list a an ARM 64-bit versjon, only js8call_2.2.0_armhf.deb which is
a 32-bit version.

Installation from source is relatively straightforward. The tar file content directory need to be renamned to src. 
Apart from that follow the instructions in the INSTALL file in the src directory. There are some prerequsites,
```
sudo apt install cmake gfortran libfftw3-dev libboost-log1.74.0 \
libqt5multimedia5-plugins libqt5gstreamer-dev install qtmultimedia5-dev libqt5serialport5-dev 
```
I built hamlib from source hence both source and installation were already present. 

For OrangePi which is 64-bit it need to be built from [source](http://files.js8call.com/2.2.0/js8call-2.2.0.tgz).
The tar file is the src directory, 
```mv js8call src; mkdir js8call; mv src js8call; cd js8call```

My build for this combination is available : 
[js8call_2.2.1-devel_arm64.deb](https://github.com/olewsaa/amateur-radio/blob/main/OrangePi/js8call_2.2.1-devel_arm64.deb),
download using wget https://github.com/olewsaa/amateur-radio/blob/main/OrangePi/js8call_2.2.1-devel_arm64.deb?raw=true ,
maybe a rename is needed, to js8call_2.2.1-devel_arm64.deb.
Install with ```dpkg -i js8call_2.2.1-devel_arm64.deb```


## eMMC
A script to copy the installation on the TF card is needed. This scipt
came with the Ubuntu 20.04 «focal» distro, but works fine with «jammy» 
also. I have included them (nand-sata-install & exclude.txt) in my repo.  
Just copy the two files and run the script (you maybe need to set it executable
using ```chmod +x /usr/sbin/nand-sata-install```).

```
cp nand-sata-install /usr/sbin/
cp exclude.txt /usr/lib/nand-sata-install/exclude.txt
```

then execute the script and select:
* 2 Boot from eMMC - system on eMMC
* This script will erase your eMMC. Continue? Yes
* 1 ext4
* Power off 

System will halt, turn power off end remove the TF card and turn power 
on and the system should boot and come up with the embedded multimedia
card leaving the TF slot available for removable storage.


