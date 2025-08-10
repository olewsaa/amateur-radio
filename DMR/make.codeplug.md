# Make codeplug script

## Introduction
Editing the codeplug is boring and tedious whether one use a spreadsheet type GUI with put'n-paste 
or edit a text file with the needed information. 

I did some work on a script that could take only the minimum information and generate a 
DMR config file for dmrconfig. The analog repeaters are limited in numbers so I did not
put too much automation these lines. That are close to what's in the final config file.

A major issue is that each entry need to be correctly numbered for the dmrconfig to know
which zones contain which talkgrous groups etc. This script make sure that the numbering is
correct. 

There are presently five input file :
- analog.channels.inp
- digital.repeaters.inp
- talkgroups.inp
- contacts.inp
- last.heard.inp

The names should be self explanatory. 
The last.heard file is not updated since the database that used to host this information
no longer is online and the new currently do not support download of last heard. 

As my radio (BF1701) has limited memory, it can only hold 10k entries. 



## analog.channels.inp
The syntax is very close to the dmrconfig configure file, as mention above the 
analog channels as limited in numbers. Hence, making is a small task to handle 
manually. The major difference is that the first column signifies if the A or B
channel is to be used when assigning. All the A entries need to be listed before
the B entries are listed.
```
# Simplex
a	Call_2m          145.500   +0       High  -    240 -  -      1  -      -      12.5
a 	145.5125	 145.5125  +0       High  -    240 -  -      1  -      -      12.5
b  	Call_70cm        433.500   +0       High  -    240 -  -      1  -      -      12.5
b  	433.5250         433.5250  +0       High  -    240 -  -      1  -      -      12.5
```

## digital.repeaters.inp
This file lists the digital repeaters to be programmed into the radio. The user only need t
to supply a minimum of information.
```
Station QTH	Callsign	Frequency	Offset	Color 
Roverkollen	LD1OA		434.8875	-2	    1
Kolsas		LA2YRR		434.9250	-2	    1
Stenungsund	SK6QA		145.7125 	-0.6	6
Uddevalla	SL6ZAQ		145.7375	-0.6	6
```
I did think of a rule to set the offset at -2 for 70cm and -0.6 for 2m, but
there are some which have zero of different offset. 


## talkgroups.inp
This are different talkgroups to be assigned to each repeater. 
```
# TG name   Timeslot	Receive group	Ref.no.	Comment 
Parrot         	1	-		1	# Parrot
Norway         	1	1		2	# Norway
WorldMaritime  	1	-		16	# Maritime_World
Worldwide      	1	-		17	# World_wide
```
As this is just a small extract the numbers do not line up.

## contacts.inp
The contacts need to be added to the config files and their numbers 
need to match.
```
Contact Name             Type    ID       RxTone
    1   Parrot           Private 242997   +	
    2   Norway           Group   242      +
   16   Maritime_World   Group   9101     +
   17   World_wide       Group   91       +
```
As these seldom changes I did not program in the automatic numbering. 


## last.heard.inp
This is just a numbered dump of the last seen "last heard" contact data base.


