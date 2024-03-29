# Pat services communications

## Software and rig
Some additional software are needed, most common are 
[Hamlib](https://hamlib.github.io/) and [Flrig](http://www.w1hkj.com/).
Hamlib (the rigctl command) takes commands from Pat and forward them to either the 
radio or Flrig. Using flrig provides a graphical interface and full (well not really) 
control of the radio. 

The program that connects directly to the radio via USB cable need to support the
radio. Hamlib and flrig have a different pool of supported radios. The supported
radios can be listed with simple commands.

- Hamlib: *rigctl -l*
- Flrig : [documentation](http://www.w1hkj.com/flrig-help/supported_transceivers.html)

To set the rig in Flrig use a pull down menu in the graphical interface. 
For Hamlib, the rig number 4 is Flrig, which just forward the commands to 
Flrig (port 12345).

The box chart show Pat forward commands (over port 4532) to Hamlib which again forward  
(over port 12345) to Flrig, which eventually send binary radio specific codes to the 
radio over the USB connection.

A simpler solution is to let Hamlib connect to the radio using a command like this,
```
rigctld -m 1051 -r /dev/ttyUSB1 &
```
The rig number 1051 is the [Guohe Q900](https://www.guohedz.com/Q900).
Make sure the USB port is the correct one. 

## Hosts and ports
IP addressing and ports are integral parts of a client server architecture. 
Pat is a typical example of this kind of architecture. Pat act as a server 
and a client. The different programs communicate and exchange data usign the 
addressing and for each host each service has its own port. For small systems 
like a computer running Pat all these programs run cuncurrently on one host, 
referred to as *localhost* (IP numbner 127.0.0,1). Hence only the different 
ports are of interest (most of the times). 


## Local USB connections
Deviced commected to USB are typically a class calles *character devices*. 
They are known with
the associalted device file in the /dev directory, ttyXXX (Linux used file 
mapping for input and output). 
There are two common USB device files, ttyUSBx (ttyUSB have chipset-specific 
drivers in the Linux kernel) and tty/ACMAx (ACM is a generic USB class driver 
for a modem) they represent 
[different USB devices](https://rfc1149.net/blog/2013/03/05/what-is-the-difference-between-devttyusbx-and-devttyacmx/). 

- ttyACM is a modem interface, but works for serial devices with no modem.
- ttyUSB have chipset specific drivers in the Linux kernel.
- ttyS has a UART in the host, like RS232 communication.

There are [rules defined](https://michaelbergeron.com/blog/gpsd-raspberrypi) 
for many types of hardware. A common class is a GPS connected through USB. 
Where line might look like :
«ACTION=="add", KERNEL=="ttyUSB[0-9]*", SUBSYSTEM=="tty", SUBSYSTEMS=="usb", ATTRS{idProduct}=="2303", ATTRS{idVendor}=="067b", SYMLINK+="gps"».

These rules deal with many user devices that are pluggable, 
[udev documentation](https://opensource.com/article/18/11/udev) or
[udev wiki](https://wiki.archlinux.org/title/udev).


## Co-operation
Putting all the boxes to work,

The different programs interact via IP connections sending messages
using the TCP protocl (UDP do not seem to be used).
With help of the transport network (shared memory, Ethernet or wifi)
the differnt programs interact and together provide the service we
expect. This kind of co-operation is mostly refered as the
[client/server model](https://en.wikipedia.org/wiki/Client%E2%80%93server_model). 
It offers great flexibility, just think how easy it is to change to 
ARDOP instead of VARA.










