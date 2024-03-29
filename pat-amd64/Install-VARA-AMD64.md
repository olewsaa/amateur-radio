
# Installing VARA on amd64 using Linux.

## Relevant web pages to start with.

To learn more about this topic these sites provide valuable 
insight.

- https://aarg.club/?page_id=308 I did not install Winlink Express.
- https://wiki.winehq.org/Winetricks
- https://rosmodem.wordpress.com/
- https://forum.winehq.org/viewtopic.php?t=18949



## Install VARA on Linux, amd64. Wine and VARA.
I use pat instead of Winlink hence this document only deal with
pat and vara. 
just download the latest pad version, https://github.com/la5nta/pat/releases 
and install the dep package. Presently it's the 
[0.15 version](https://github.com/la5nta/pat/releases/download/v0.15.0/pat_0.15.0_linux_amd64.deb).



## Installing WINE
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
```
sudo wget ‘https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks’ -O /usr/local/bin/winetricks
/usr/local/bin/winetricks vb6run
/usr/local/bin/winetricks corefonts vcrun6 
```
The lines:
```
winetricks -q dotnet48
winetricks vcrun2015
``` 
are probably not needed for a VARA only installation.

Click install to install mono:
![wine mono](https://github.com/olewsaa/amateur-radio/blob/main/pat-amd64/wine-mono.png
"Click yes to install mono")


Click unzip, ok and close to unpack the needed files:
![unzip](https://github.com/olewsaa/amateur-radio/blob/main/pat-amd64/unzip.png
"click unzip, ok and close")

Just click yes to install the required software.
![VB](https://github.com/olewsaa/amateur-radio/blob/main/pat-amd64/VB.png
"Clik yes")

![VCRedist](https://github.com/olewsaa/amateur-radio/blob/main/pat-amd64/VCRedist.png
"Click yes")

## Installing VARA
Go to  https://rosmodem.wordpress.com/ and  Download VARA : 
Two links:
- VARA HF v4.7.7 (High Performance HF Modem)
- VARA FM v4.2.9 (VARA for FM transceivers)
They will open a new tab for download of the relevant zip files.

Download http://files.k6eta.com/VARA_Components.zip and unzip the 
file ```VARA_components.zip```

Check username below, replace my user name with your username.
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
cp ~/.wine/drive_c/users/ole/Temp/pdh.??? ~/.wine/drive_c/windows/system32/

wine ~/Downloads/VARA\ setup\ \(Run\ as\ Administrator\).exe
wine ~/Downloads/VARA\ FM\ setup\ \(Run\ as\ Administrator\).exe
```

If all went ok it should work ok.




