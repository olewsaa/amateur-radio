# Utilities

## Winlink express and GPSD
Winlink express expect a stream of NMEA sentences to pick up
the postion. The yacht server on board serves all other hosts and 
units with GPS data via GPSD on port 2947. Winlink do not support
GPSD, only direct attached USB/serial GPS "mice".

The script *gpsd2nmea* convert to NMEA sentences which Winlink
can pick up. Winlink support tcp connection in addition to serial
ports, e.g. direct attached GPS "mouse". 

The script uses *netcat* to forward the stream to a specific port (1234). 
This is fortunately not in conflict with Flrig and Hamlib which uses 
port 12345. 

The script also provide info about the PID number in 
order to verify	that it's actually started. The	'no' button
can be used to shut it down.

Using the CLI is not always practical in a boat, icons to click on is often 
easier, file gpsd2nmea.png is a suitable icon for the button that control the 
gpsd2nmea. 


## Rigctl / Hamlib
The application for FT8 and associated modes [WSJT-X](https://wsjt.sourceforge.io/index.html)  
uses Hamlib/rigctl + Flrig to control the radio. If Hamlib is not started before launching
the xsjt-x application it will not work. Hence a control button on the desktop to start
it cen be beneficial. 

The script *rigctld.start* will start the rigctrld demon. It also provide info
about the PID number in order to veryfy that it's actually started. The 'no' button
can be used to shut it down.





