
# Installing Wine, Winlinlk, VARA on amd64 system running Linux.

## Relevant web pages to start with.

To learn more about this topic these sites provide valuable 
insight.

- https://aarg.club/?page_id=308 I did not install Winlink Express.
- https://wiki.winehq.org/Winetricks
- https://rosmodem.wordpress.com/
- https://forum.winehq.org/viewtopic.php?t=18949


## Installing WINE

Wine is part of the distribution and can be installed using the usual commands with
Debian/Ubuntu. I have also had success with just the repo installation. The current 
version is Wine 9.

This transcripts shows a more manual approach. 
### A transcript of the commands used.
```
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key

```

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


Click unzip, ok and close to unpack the needed files:
![unzip](https://github.com/olewsaa/amateur-radio/blob/main/pat-amd64/unzip.png)
"click unzip, ok and close"

Just click yes to install the required software.
![VB](https://github.com/olewsaa/amateur-radio/blob/main/pat-amd64/VB.png)
"Clik yes"

![VCRedist](https://github.com/olewsaa/amateur-radio/blob/main/pat-amd64/VCRedist.png
"Click yes")


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
If all went ok it should work ok.


## Radio configuration

The [Q900](https://www.guohedz.com/Q900#) provide a command set compatible 
with Yeasu FT-817. Hence selecting Yuesu FT-817 should work, I not experienced any
issues to the CAT control.

### Winlink

Make sure the symlink for COM33 in `$HOME/.wine/dosdevices` is present and point to
the USB port the radio provides, in the Q900 case it's `/dev/ttyACM0`. 
```
ole@nina:~/.wine/dosdevices $ ls -l COM33 
lrwxrwxrwx 1 ole ole 12 mars  17  2025 COM33 -> /dev/ttyACM0
```
The name `/dev/ttyACM0` is not always the same and it's possible to write rules that 
trigger setting of more sensible names. Some day I'll put up the udev rules here.


I have configured CAT control in Winlink:

- Select Radio model : Yaesu FT-817
- Select USB 
- Tick off Use Radio Internal Soundcard. 
- Select serial port COM33.
- Select baud rate 19200.
- Leave Enable RTS and DTR off.
- The PPT port need to be selcted, select FT-817.
- Tick off the log if logging is needed.


![Winlink radio setup](https://github.com/olewsaa/amateur-radio/blob/main/Winlink-Linux-amd64/Winlink.Q900.setup.png)


### VARA

Set the correct soundcard, the Q900 should appear in the pull down
soundcard menu in VARA. Select input and output correspondingly. 
Test the TUNE button and see if the radio transmit and regulate the 
gain to a suitable level. 



### GPS
If you want GPS signal from a gpsd server some more steps are required.
The Winlink program only support direct attached GPS devices. 

See the page about 
[One the move](https://github.com/olewsaa/amateur-radio/blob/main/on-the-move/README.md),
I have the radio station omboard a boat so QTH changes from day to day.



