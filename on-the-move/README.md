# On the Move
## Introduction

When the station is located in your boat the QHT is a dynamic value. 
Hence the config files do not necessarily contain the current location.
While some applications can use gpsd to request a location this not
always the case. I have put together a little selection of scripts that update the config files for some of the applications I use. 

## SignalK

[SignalK](https://signalk.org/) is a popular protocol used in boating 
for distributing data. From the web page :«A Free and Open Source universal 
marine data exchange format». The requests for data from the SignalK server 
is done using the http protocol.

## No internet, no NTP server
While the Yacht computer is expected to only be running when the instruments are
running it do not have its own GPS. The local time is syncronised every 10 mins using
cron job that sets the local clock. This time is picked up by NTP if there is no
internet and others systems can update their time using NTP-client from the yacht 
server's NTP server process. Please see the ntp.conf for details. 

## Python scripts
Common for these scripts is requesting information from the SignalK server.

- set-date-from-SignalK.py --  set the correct time and date.
- showpos.py  -- Emit a lat, lon position and corresponding Maidenhead grid.
- update.pos.pat.conf.py --  update the position in pat's config file.
- update.pos.WSJT-X.conf.py -- update the position in WSJT, JS8Call and TQSL.

## Automatic run at boot time
The two scripts can be launched at boot time by means of the cron system.
The cron file have a keyword to run a script at boot time. The file crotab
contain an example of a typical setup to run the script that update the pat and
other application containing QTH info.


