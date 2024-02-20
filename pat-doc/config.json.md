# PAT config file

## Introduction
The config file is a json
[JavaScript Object Notation](https://en.wikipedia.org/wiki/JSON) file.
This is very common data format. A minor disadvantage is that comments are
not allowed in the file itself. Comments can be useful to document the 
different statements.  The whole object is enclosed in curly brackets, '{}'
Well known for C programmers. 


### JSON format
The json format is fairly simple, but all brackets and commas need to match.
Some editing of the config file might be needed.
```
{
	"item" : "value",
	"item" : "value",
	"item" : ["a", "b"],
	"item" : "value"
}
```
Notice no comma after the last line. Programs that read json are not forgiving and
pat is no expection. Any error will cause pat to abort.

There are many pages that provide [tutorials](https://www.w3schools.com/js/js_json_intro.asp).


### IP Addresses and ports.
Each node in an IP network has an IP
number. Each node will have a set of ports open for
communication. Common ports are 22 for ssh and 80 for web servers.
The different programs that are involved need to exchange messages to
each other.  Each of the programs listen or transmit on different
ports. Each of the programs have its own dedicated ports. A common
example is the web server, it normally listen on port 80 for incomming
requests and send web page content on the
[same port](https://youtu.be/PBWhzz_Gn10?si=6ed9sxvecI5Ju2C_).
The port can be set by the user like the common usage of port 5000 for
the pat web server.  (request then look like: http://localhost:5000).
Some common ports relevant for pat include:

- 80, Common port for web servers.
- 22,  secure shell, ssh.
- 2947,  GPS, the gpsd server.  
- 4532, Hamlib, rigctl, rigctld.
- 12345, flrig.
- 8300,  VARA, both HF and FM.
- 8515,  ARDOP.
- 5000, PAT web server (if set to 5000 in config).

Most of these communicate on the same host which is referred to a localhost
(127.0.0.1 if an ip number is needed). In principle the other programs might
run on different hosts, a common example is gpsd, then both a valid
ip address and the port number should be supplied (althrough most gpsd clients
use the default 2947). 

## Push to Talk, transmit 
The transceiver need to be keyed with a push to talk, ptt. This can be done 
in multiple ways. 

- VOX
- [SignaLink](https://tigertronics.com/slusbmain.htm) VOX with cable ptt to transceiver
- CAT control ptt (hamlib, flrig etc)

Setting ```"ptt_ctrl": true``` will inform pat that it need to propagate 
a push to talk signal to the radio. 

## Setting the rig
The name of the rig need to be set, like ```"rig": "Q900"```. 
This rig must be supported in [hamlib](https://github.com/Hamlib/Hamlib), 
[rigctl](https://man.archlinux.org/man/rigctl.1.en). Hamlib can rigctl demon
can use [flrig](http://www.w1hkj.com/flrig-help/) to send the commands to the radio. 
A line like this can be used:
```bash
rigctld -m 4 > rigctld.log &
```
The code 4 signify flrig. 

An alternative which do not use flrig is to set the rig with the rigctl demon
and provide a TTY device.
```bash
rigctld -m 1051  -r /dev/ttyUSB0 -s 19200  > rigctld.log &
```
The rig 1051 is the [Guohe Q900](https://www.guohedz.com/Q900) 
from [Guohe Electronics](https://www.guohedz.com/).


## User info
In order to be recognised on the Winlink system one need to supply
personal information like call sign, location and password.

If this is the first lines one need to have a '{' at the start of the text,
this match a closing '}' at the end of the file. 

    "mycall": "CALL",
    "secure_login_password": "PASSWORD",
    "auxiliary_addresses": [],
    "locator": "JO59dm",
    "service_codes": [
        "PUBLIC"
    ],
    "http_addr": "localhost:5000",
    "motd": [
        "Open source Winlink client - getpat.io"
    ],

## Connect aliases 

    "connect_aliases": {
        "telnet": "telnet://{mycall}:CMSTelnet@cms.winlink.org:8772/wl2k",
		"LA2T-160m": "varahf:///LA2T?freq=1843&bw=500",
        "LA1T-80m":  "varahf:///LA1T?freq=3592&bw=500",
        "LA2T-80m":  "varahf:///LA2T?freq=3595.5&bw=500",
        "LA5G-80m":  "varahf:///LA5G?freq=3594&bw=500",
        "LA1T-60m":  "varahf:///LA1T?freq=5273&bw=2300",
        "LA2T-60m":  "varahf:///LA2T?freq=5270&bw=2300",
        "LA5G-60m":  "varahf:///LA5G?freq=5355&bw=2300",
        "LA1T-40m":  "varahf:///LA1T?freq=7045&bw=500",
        "LA1T-30m":  "varahf:///LA1T?freq=10144&bw=500",
        "LA2T-40m":  "varahf:///LA2T?freq=7057&bw=2300",
        "LA5G-40m":  "varahf:///LA5G?freq=7045.5&bw=500",
        "LA5G-30m":  "varahf:///LA5G?freq=10144.5&bw=500",
        "LA9K-20m":  "varahf:///LA9K?freq=14109.5&bw=2300",
        "HB9AK-17m": "varahf:///HB9AK?freq=18114.4&bw=2750",
        "LA7F-40m":  "varahf:///LA7F?freq=7045&bw=500",
        "LA7F-30m":  "varahf:///LA7F?freq=10144&bw=500"
    },
	
## Listen mode 	

    "listen": [],

## Hamlib rigs and IP address 
Pat expect that the hamlib deamon is running and listening for messages on
port 4532.

    "hamlib_rigs": {
    "FT-817": {
            "address": "localhost:4532",
            "network": "tcp"
        }
    },
Hamlib do support Q900, but it's just a copy of FT-817 so both works.

	
## Telnet
The telnet transport is a TCP/IP based transport that uses an unecrypted 
internet connection to connect to the server cms.winlink.org . Telnet is
an old connect command that is commonly used to connect to computers, servers
and devices. Being unencrypted is sends the password in plain text and poses
a security risk it's being replaces by ssh (secure shell) today.

    "telnet": {
        "listen_addr": ":8774",
        "password": ""
    },
	
## ARDOP
ARDOP [Amateur Radio Digital Open Protocol](https://github.com/hamarituc/ardop) 
is Open source, free of charge and works fine, but with somewhat less throughput
than VARA. This lessens it's uses as more users choose to use the better 
performing (but licensed) VARA.

ARDOP communicate using the port 8515. 

    "ardop": {
        "addr": "localhost:8515",
        "arq_bandwidth": {
            "Forced": false,
            "Max": 2000
        },
        "rig": "FT-817",
        "ptt_ctrl": true,
        "beacon_interval": 0,
        "cwid_enabled": true
    },
	
## VARA HF
VARA uses port 8300 for connections. Setting the 
rig is important. Pat uses hamlib's rigctl. 

	"varahf": {
        "addr": "localhost:8300",
        "bandwidth": 2300,
        "rig": "FT-817",
        "ptt_ctrl": true
    },

## VARA FM	
As for VARA HF VARA FM uses the same port, 8300. See VAFA HF 
for setting the rig.

    "varafm": {
        "addr": "localhost:8300",
        "bandwidth": 9600,
        "rig": "FT-817",
        "ptt_ctrl": true
    },
	
## Pactor modem
Connecting a Pactor modem via USB cable. 

	"pactor": {
    "path": "/dev/ttyUSB0",
    "baudrate": 57600,
    "rig": "",
    "custom_init_script": ""
	},

  
Some Pactor modems can connect via Bluetooth. Currently no 
info on how this is done. The port ttyUSB0 is just av example,
check before using.
	
## GPS - gpsd server	
This section deal with position from GPS.
Setting up connection to a gpsd server, which
can be locally attached or provieded from a remote
server via the network. 

    "gpsd": {
        "enable_http": false,
        "allow_forms": false,
        "use_server_time": false,
        "addr": "10.10.10.1:2947"
    },
	
	
## Misc

    "schedule": {},
    "version_reporting_disabled": false

## Ending curly brackets 
}


It's important to make sure the commas and brackets are
correct. 
A good editor is helpful when editing json files.
It must be noted that json files were originally never intended
to be written or edited by humans. They are configuration files,
which are generated by some program.
