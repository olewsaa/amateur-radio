# JS8Call
## Installing
Installing JS8Call on Raspberry Pi4 is relatively straightforward.
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

