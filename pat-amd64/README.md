# pat and VARA on x86-64

## Installing pat and VARA
As winlink and VARA are software running under Windows only some
steps have been taken to address  the issue. The pat software is
a noticable piece of software. Written to replace winlink with support
for a range of transports layers, o.a. TCP/IP, ARDOP and VARA. 
ARDOP has Linux support, but it's outperformed by the windows and 
x86/x86-64 only software VARA. 

In order to run VARA the well known and well established windows
compatibility layer software [WINE](https://www.winehq.org/) is
needed.  While a mature piece of software is's slightly tedious to
install.  WINE is available with the current Linux distributions and
only require packages to install, in addition some extras and some
configurations.


### Step by step cut'n paste

The file Install-VARA-AMD64.md contain a step by step installation
instructions for manual assisted installation. This can used for a
full control manual installations, just cut'n paste the commands and
review each step. Some images of WINE (Windows) popups are includes,
but it's fairly evident what to click.

Currently the script have been tested on a system running Linuxmint
[21.2 victoria](https://linuxmint.com/download_all.php), corresponding 
to Ubuntu (on which mint is based) Jammy, which in turn 
[correspond](https://askubuntu.com/questions/445487/what-debian-version-are-the-different-ubuntu-versions-based-on) to Debian bookworm. These versions are hard 
coded into the installation scripts. 


### Script to install the software

The script «install-pat-vara» will download and install
both pat and VARA. Some manual boxes have to be clicked implying 
a graphical X11 console. This is the simple and easy way to install.
It should work, it's been tested and verified. However, there are some
many different setups out there so it's hard give promises. Some 
prerequsites have been added to the script, but some assumptions on the 
installation in quest has to be made. The script is set to exit if any
of the commands return with an error code. If installation fails, take
it step by step by cut's paste the commands and see where it fails. 




