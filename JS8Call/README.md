# JS8Call
## Installing
Installing JS8Call on Raspberry Pi4 is relatively straightforward.
Using 32 bit is to ensure compability with VARA whicn run (currently
in my installation) only at 32 bit.

For my OrangePI4 installation, I have built the 64-bit Debian package and 
so far seem to work. Review the OrangePi section to learn more. 

Download the ARM 32 bit version from the [JS8Call download site](http://files.js8call.com/latest.html), at time of writing
http://files.js8call.com/2.2.0/js8call_2.2.0_armhf.deb , download and install with :

```
wget http://files.js8call.com/2.2.0/js8call_2.2.0_armhf.deb
dpkg -i js8call_2.2.0_armhf.deb
```

### Common install issues
In some cases the audio interface selction are blank, this is caused by a missing package, this might help:

```apt install libqt5multimedia5-plugins```

After installing this package a long list of audio devices becomes available. The list is long and it might require some trial and error to find the correct device.  

