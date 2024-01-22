# pat and VARA on x86-64

## Laptop for Q900 

Using an AMD64 laptop with Pat and VARA is relatively straightforward.
As the Q900 transceiver has a built in soundcard and uses a common USB
cable for both CAT and audio there is little need for a standalone
dedicated computer.


## Installing pat and VARA HF & FM
As winlink and VARA are software running under Windows only some
steps have been taken to address  the issue. The 
[pat](https://getpat.io/) software is
a noticeable piece of software. Written as an alternative for winlink
usage with support for a range of transports layers, o.a. 
TCP/IP, ARDOP and VARA. ARDOP has Linux support with source code available, 
but it's outperformed by the windows and x86/x86-64 only software VARA. 

In order to run VARA the well known and well established windows
compatibility layer software [WINE](https://www.winehq.org/) is
needed.  While a mature piece of software is's slightly tedious to
install.  WINE is available with the current Linux distributions and
only require packages to install, in addition some extras and some
configurations.

The Q900 has a frequency range from 100 kHz to 2 GHz receive and from
1.8 to 434 MHz covering 160 m to 70 cm. Hence it support VARA FM 
at 2 m and 70 cm. 

The file "Q900-config.json" contain a config script (named
config.json) for Pat with details showing how to set up VARA HF and VARA FM.
VARA HF and VARA FM cannot be run at the same time. Both use port 8300
and the audio device hence only one can be running at the same
time. Pat cannot launch VARA, Pat expect VARA to be running when
needed. This need to handled by the user.

CAT control is handled by Pat using Hamlib and Flrig. VARA does not do PTT,
it can be set up to do so over a serial port, but Pat do this via CAT control.


### Step by step cut'n paste

The file [Install-VARA-AMD64.md](https://github.com/olewsaa/amateur-radio/blob/main/pat-amd64/Install-VARA-AMD64.md) 
contain a step by step installation
instructions for manual assisted installation. This can used for a
full control manual installations, just cut'n paste the commands and
review each step. Some images of WINE (Windows) popups are included,
but it's fairly evident what to click.

Currently the script have been tested on a system running Linuxmint
[21.2 victoria](https://linuxmint.com/download_all.php), corresponding 
to Ubuntu (on which mint is based) Jammy, which in turn 
[correspond](https://askubuntu.com/questions/445487/what-debian-version-are-the-different-ubuntu-versions-based-on) 
to Debian bookworm. These versions are hard coded into the installation scripts. 

The distros get updated from time to time and these names need to be kept up to date,
a manual job.

### Script to install the software

The script [install-pat-vara](https://github.com/olewsaa/amateur-radio/blob/main/pat-amd64/install-pat-vara) 
will download and install
both pat and VARA. Some manual boxes have to be clicked implying 
a graphical X11 console. This is the simple and easy way to install.
It should work, it's been tested and verified. However, there are some
many different setups out there so it's hard give promises. Some 
prerequisites have been added to the script, but some assumptions on the 
installation in quest has to be made. The script is set to exit if any
of the commands return with an error code. If installation fails, take
it step by step by cut's paste the commands and see where it fails. 

Things might fail if some versions have been updated, check versions 
before giving up.




