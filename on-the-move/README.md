# On the Move
## Introduction

When the station is located in your boat the QHT is a dynamic value. 
Hence the config files do not necessarily contain the current location.
While some applications can use gpsd to request a location this not
always the case. I have put together a little selection of scripts that 
update the config files for some of the applications I use. 

I have several computers used for CAT control. One older laptop is hooked
up and used with the Q900 radio. Hence there are example of config files 
for GPS and NTP, containing q900 in the file name, 

GPS units can often provide a Pulse Per Second (PPS) signal. This can
be conveyed via USB to the computer. It require a
[GPS](https://www.aliexpress.com/item/1005005398087680.html) units
that emit PPS and a [USB chip
driver](https://www.aliexpress.com/item/1005008325231530.html) that
propagate the PPS signal. While not as good as a real RS232 serial
port it provides a far better time sync than just GPS or NTP servers
on the internet. Here's some [info about the
subject](https://kloppenborg.net/blog/gps-pps-over-usb/).

## Showpos
A small script that scan for GPSD and SignalK servers. It start with 
scanning a predefined list of known addresses (this is normally enough).
If no servers are found it scan through the entire subnet, this might take
some time. In nothing is found it emits data from «demo.signalk.org».
![Control window](https://github.com/olewsaa/amateur-radio/blob/main/on-the-move/showpos.png)

## SignalK

[SignalK](https://signalk.org/) is a popular protocol used in boating 
for distributing data. From the web page :«A Free and Open Source universal 
marine data exchange format». The requests for data from the SignalK server 
is done using the http protocol.

## No internet, no NTP server
While the Yacht computer is expected to only be running when the
instruments are running it do not have its own GPS. The local time is
syncronised every 10 mins using cron job that sets the local
clock. This time is picked up by NTP if there is no internet and
others systems can update their time using NTP-client from the yacht
server's NTP server process. Please see the ntp.conf for details.

## Python scripts
Common for these scripts is requesting information from the SignalK server.

- set-date-from-SignalK.py --  set the correct time and date.
- showpos.py  -- Emit a lat, lon position and corresponding Maidenhead grid.
- update.QTH  -- Update the position for Pat, WSJT, JS8Call and TQSL.

![Control window](https://github.com/olewsaa/amateur-radio/blob/main/on-the-move/QTH-update.png)

The script update.QTH open a window showing position and which 
config files that have been updated.

The updated versions v2 and v3 both have the option to enter lat lon
manually, either on the command line or via a pop-up GUI asking for
input. the two versions have a slightly differen GUI input, and the v2
version also update winlink (which I run under wine).  I did include
test if there is a winlink .ini file to avoid errors if the file was
not present.
 

## Automatic run at boot time
The position update script can be launched at boot time by means of
the cron system, but it must have a reliable GPS signal, hence if the
GPS is locally attaced some delay is needed.  The cron file have a
keyword to run a script at boot time, or after a time delay.  The file
crotab contain an example of a typical setup to run the script that
update the pat and other application containing QTH info.


