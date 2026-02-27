# Make codeplug script

## Introduction
Editing the codeplug is boring and tedious whether one use a spreadsheet type GUI with put'n-paste 
or edit a text file with the needed information. 

The syntax of the input files have been set to the bare minimum. Just the major information
need to be input manually. Anything more complicated need to be edited in the generated
config file. The manjor issue with manual editing is the sequence of channels, talkgroups etc.
Hence a script which do the tedious heavy lifting of keeping track and make sure the numbers
are unique and don't overlap is productive.

I did some work on a script that could take only the minimum information and generate a 
DMR config file for dmrconfig. The analog repeaters are limited in numbers so I did not
put too much automation these lines. That are close to what's in the final config file.

A major issue is that each entry need to be correctly numbered for the dmrconfig to know
which zones contain which talkgrous groups etc. This script make sure that the numbering is
correct. 

There are presently four input files :
- analog.channels.inp
- digital.repeaters.inp
- talkgroups.inp
- contacts.inp


The names should be self explanatory. 
A number of Nordic users are extracted from the radioID data base and are 
inlcuded as contacts. 

As my radio (BF1701) has limited memory, it can only hold 10k entries,
hence only Nordic users.

At the top of the codeplug there is a line describing the radio. 
```
Radio: Retevis RT84
```
This is compatible with BF1701.


## analog.channels.inp
The syntax is very close to the dmrconfig configure file, as mention above the 
analog channels as limited in numbers. Hence, making is a small task to handle 
manually. The major difference is that the first column signifies if the A or B
channel is to be used when assigning. All the A entries need to be listed before
the B entries are listed.
```
# Simplex
a	Call_2m          145.500   +0       High  -    240 -  -      1  -      -      12.5
a 	145.5125     	 145.5125  +0       High  -    240 -  -      1  -      -      12.5
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



## Generating the config file
To generate the config file just issue the command (remember to make it 
executable using chmod +x make.codeplug) :
```bash
./make.codeplug > my-config-script.conf
```
this will make an ASCII test file containing the configuration, AKA codeplug.
Being a text file it can be edited in a normal text editor. Just keep in mind
that the numbering of entries are sensitive to any changes. 

The script will download the list of DMR users from radioID and extract 
Nordic users. There is an elaborate RegExp selecting only Nordic users. 
This can be altered to select other regions og countries. 

## Writing the codeplug to the radio.

After making the config file it can be written to the radio :
```bash
dmrconfig -c my-config-script.conf
```
The config file should probably have some sensible naming like 2026-FEB-27.conf or something
similar to keep a older ones when updates and additions might introduce errors.

The command name might sound like I'm using a make file to do the job, which I did not,
initially I called it generate.codeplug. However, make.codeplug sounded better.
