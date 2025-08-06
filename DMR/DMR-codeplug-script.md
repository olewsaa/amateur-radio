Script to generate a config text file that the utility dmrconfig can process and
write it into the radio. I have a Baofeng 1701 which works nicely with dmrconfig.
The page for dmrconfig is : https://github.com/OpenRTX/dmrconfig .

This set of scripts helps to generate a config file for the dmrconfig utility.
While not a real replacement for spreadseet like interfaces, it does provide a
reasonably simple way to enter the repeaters and talkgroups in plain text format. 

As for the analog channels this is fairly easy to program as there are only one
frequency per repeater or maybe two 2m and 70cm. 

The digital entries are tedious to program as there are a long list of talkgroups
per frequency for the DMR station. This utility generate the digital talkgroups.

There are four input files:
a) Analog repeaters (analog.channels.inp)
b) Digital repeater (digital.repeaters.inp)
C) Talkgroups for repeaters (talkgroups.inp)
d) List over last heard stations (last.heard.inp)

As for the last heard this used to be updated but the commonly used DB has been
shut down with (to my knowledge) viable alternative. This file is not stricktly
needed. It only translate from DMR ID to callsign which is displayed on the radio.

While the talkgroups generally remain constant the repeater stations is frequently
added if you're operating mobile.

The syntax of the input files have been set to the bare minimum. Just the major information
need to be input manually. Anything more complicated need to be edited in the generated
config file. The manjor issue with manual editing is the sequence of channels, talkgroups etc.
Hence a script which do the tedious heavy lifting of keeping track and make sure the numbers
are unique and don't overlap is productive.



