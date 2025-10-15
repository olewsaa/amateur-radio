
# Installing Wine, Winlink (RMS Express), VARA on amd64 system running Linux.

## Relevant web pages to start with.

To learn more about this topic these sites provide valuable 
insight.

- https://wiki.winehq.org/Winetricks
- https://rosmodem.wordpress.com/
- https://forum.winehq.org/viewtopic.php?t=18949
- https://gitlab.winehq.org/wine/wine/-/wikis/Winetricks

## Installing WINE

Wine is part of the distribution and can be installed using the usual
commands with Debian/Ubuntu. I have also had success with just the
repo installation. At the time of writing the current version is Wine 9.

This transcripts shows a more manual approach, with explicit versioning of 
the distribution, in this case Bookworm. 

### A transcript of the commands used.
```
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
wget -nc https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources
sudo mv winehq-bookworm.sources /etc/apt/sources.list.d/
sudo apt update
sudo apt install --install-recommends winehq-stable
winecfg
wine iexplore
```
The 32-bit version (i386) is added to include 32-bit libraries. Even decades
after the introduction of x86-64 architecture many programs are still 
32-bit. 

### Winetricks

The [Winetricks](https://gitlab.winehq.org/wine/wine/-/wikis/Winetricks) 
web page state the following:
_"Winetricks is a helper script to download and install various
redistributable runtime libraries needed to run some programs in Wine.
These may include replacements for components of Wine using closed
source libraries."_

```
sudo wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks -O /usr/local/bin/winetricks
/usr/local/bin/winetricks vb6run
/usr/local/bin/winetricks corefonts vcrun6 
winetricks -q dotnet48
winetricks vcrun2015
``` 


Click install to install mono:
![wine mono](https://github.com/olewsaa/amateur-radio/blob/main/pat-amd64/wine-mono.png)
"Click yes to install mono"


Click unzip, OK and close to unpack the needed files:
![unzip](https://github.com/olewsaa/amateur-radio/blob/main/pat-amd64/unzip.png)
"click unzip, OK and close"

Just click yes to install the required software.
![VB](https://github.com/olewsaa/amateur-radio/blob/main/pat-amd64/VB.png)
"Click yes"

![VCRedist](https://github.com/olewsaa/amateur-radio/blob/main/pat-amd64/VCRedist.png)
"Click yes, or in this case Ja"


## Installing VARA
Go to  https://rosmodem.wordpress.com/ and  Download VARA : 
Two links:
- VARA HF v4.8.9 (High Performance HF Modem)
- VARA FM v4.3.8 (VARA for FM transceivers)
They will open a new tab for download of the relevant zip files.

Download http://files.k6eta.com/VARA_Components.zip and unzip the 
file ```VARA_components.zip```

Check username below
```
cd Downloads/
unzip VARA\ HF\ v4.7.7\ Setup.zip 
unzip VARA_components.zip 
unzip VARA\ FM\ v4.2.9\ setup.zip

cp VARA\ setup\ \(Run\ as\ Administrator\).exe ~/.wine/drive_c/windows/system32
cd Downloads
cp Put_in_System32/* ~/.wine/drive_c/windows/system32 
wget 'http://download.microsoft.com/download/winntsrv40/update/5.0.2195.2668/nt4/en-us/nt4pdhdll.exe' -O nt4pdhdll.exe
wine ~/Downloads/nt4pdhdll.exe
cp ~/.wine/drive_c/users/${USER}/Temp/pdh.??? ~/.wine/drive_c/windows/system32/

wine ~/Downloads/VARA\ setup\ \(Run\ as\ Administrator\).exe
wine ~/Downloads/VARA\ FM\ setup\ \(Run\ as\ Administrator\).exe
```
If all went OK it should work OK.


## Radio configuration

The [Q900](https://www.guohedz.com/Q900#) and the newer PMR-171, provide a 
command set compatible with Yaesu FT-817. Hence selecting Yaesu FT-817 should work, 
I not experienced any issues to the CAT control.

### Winlink
Unfortunately RMS Express do not support Hamlib (and hence flrig). It uses the
COM ports directly with a small selection of radios. In my case the Q900 and the
PMR-171 is compatible with the FT-817 command set.

Make sure the symlink for com33 in `$HOME/.wine/dosdevices` is present and point to
the USB port the radio provides, in the Q900 case it's `/dev/ttyACM0`. 
```
ole@nina:~/.wine/dosdevices $ ln -sf /dev/ttyACM0 com33
ole@nina:~/.wine/dosdevices $ ls -l com33 
lrwxrwxrwx 1 ole ole 12 mars  17  2025 com33 -> /dev/ttyACM0
```
The name `/dev/ttyACM0` is not always the same and it's possible to write rules that 
trigger setting of more sensible names. Some day I'll put up the udev rules here.


I have configured CAT control for RMS Express :

- Select Radio model : Yaesu FT-817
- Select USB 
- Tick off Use Radio Internal Soundcard. 
- Select serial port com33.
- Select baud rate 19200.
- Leave Enable RTS and DTR off.
- The PPT port need to be selected, select FT-817.
- Tick off the log if logging is needed.


![Winlink radio setup](https://github.com/olewsaa/amateur-radio/blob/main/Winlink-Linux-amd64/Winlink.Q900.setup.png)


### VARA

Set the correct soundcard, the Q900, or another radio, should appear
in the pull down soundcard menu in VARA. Select input and output
correspondingly.  Test the TUNE button and see if the radio transmit
and regulate the gain to a suitable level.


VARA FM do not suppport more than 16 COM ports. Hence in order to get the 
PTT to work a symbolic link to com16 is needed. And select com16 for PTT 
control.
```
ln -sf /dev/ttyACM0 com16
ole@nina:~/.wine/dosdevices $ ls -l com16
lrwxrwxrwx 1 ole ole 12 okt.  15 16:45 com16 -> /dev/ttyACM0
```
The fact that two com ports point to the same /dev/ttyACM0 is normally not 
an issue.



### GPS
If you want GPS signal from a gpsd server some more steps are required.
The Winlink program only support direct attached GPS devices. 

See the page about 
[One the move](https://github.com/olewsaa/amateur-radio/blob/main/on-the-move/README.md),
I have the radio station onboard a boat so QTH changes from day to day.
