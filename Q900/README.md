# Q900 transceiver

## Introduction
The [Q900 transceiver](https://www.guohedz.com/Q900) is a transceiver from 
[Guohe Electronic Technology Co., LTD.](https://www.guohedz.com/). 
From the web site «Q900 V4 Ultra-portable SDR Transceiver Short Wave Radio 
Station 100KHz-2GHz HF/VHF/UHF ALL Mode». The radio comes with built in 
"sound card" which share the same USB cable/connection, hence only a 
*single USB cable* is needed to connect a laptop to the radio.
[Official Youtube channel](https://www.youtube.com/@GUOHETEC/featured)

The radio have two antenna connections one supporting 100 kHz to 74 MHz using a 239 UHF
connector while the other support 74 MHz to 2 GHz via the SMA connector. 
It can transmit on the ham bands from 160 m to 70 cm. 
While it can receive at the 23 cm band it cannot transmit. 

The radio also have Bluetooth and several mobile phone apps exist to 
connect to the radio. Using the FT8 app works fine. 

It works from built in battery or from 12 V input. The battery can be
charged using USB-C connection.

Mine is installed onboard [Algol](https://algol.homelinux.no/) 
and uses an [isolated backstay](https://www.homelinux.no/radio) as HF 
antenna and a fiberglass 2m/70cm antenna at the masthead. 


## CAT control
CAT control is done via USB connection, the command set is compatible
with Yaesu FT-817, support in [hamlib](https://github.com/Hamlib/Hamlib)
for the Q900 was just added, Jan '24. 
It works fine, combined with [flrig](http://www.w1hkj.com/). 
PTT is most important which works nicely. Using
flrig to control mode and frequency also works fine. There are
probably a few commands not yet implemented, like filters, modes, 
various gain and volume controls. 

## Pat
Pat rely on hamlib and flrig to control the radio via CAT control and
works fine.  The audio is built into the radio and is sharing the same
USB connection, which mean that there is only *one* USB cable from the
Q900 to the laptop. 

### VARA 
Both VARA HF and VARA FM works without any major issues, just select USB audio
and the built in soundcard will do the interfacing. Level need to be adjusted 
on the laptop side to keep the audio level in the "green". 

## Digital modes
As CAT control and audio is working there are few issues with FT8 and
other digital modes. 

## Apps for phone and tabs
There are apps that can control the radio as well as run 
[FT8](https://github.com/N0BOY/FT8CN/releases) via Bluetooth. 


