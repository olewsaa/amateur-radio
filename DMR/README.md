# Linux-Native DMR Codeplug Generator

A lightweight, UNIX-centric Bash and Awk script to automatically build DMR 
and analog codeplugs for `dmrconfig`. 

Maintained by **Ole W. Saastad, LB4PJ** (DMR ID: 2420509).


## Why use this?
Instead of wrestling with clunky Windows CPS software or heavy 
spreadsheet GUIs, this workflow treats your radio configuration as plain text.

* **Automated Talkgroup Mapping:** Enter your talkgroups once; the script 
dynamically maps them to every digital repeater.
* **Smart Zoning:** Automatically generates clean geographical zones for 
analog and digital repeaters.
* **Automated DMR Data Fetching:** The script connects directly to Brandmeister 
and RadioID databases to pull real-time callsigns and user IDs. It filters these 
down using regional constraints (e.g., Scandinavia/North Europe) to populate 
your radio’s digital contacts up to its hardware limit, ensuring the display 
shows the correct ham identity upon reception.
* **Multi-Radio Ready:** Easily adapts to multiple radios supported 
by `dmrconfig` (e.g., TYT MD-9600, Baofeng DM-1701/Retevis RT84) by 
modifying a single parameter.

## Prerequisites
You must have `dmrconfig` installed. See the 
[OpenRTX dmrconfig Wiki](https://github.com) for installation details 
and supported hardware.
### Note on building from source
While the source code is on git and available, the Make file is not fully 
correct. There are a some missing libraries. The BSD libraries are not
included in the prerequisites. I have made an updated 
[Makefile](https://github.com/olewsaa/amateur-radio/blob/main/DMR/Makefile.dmrconfig) 
which contain the needed information to build dmrconfig.
Very small changes *"apt-get install libbsd libbsd-dev"* and 
*"-lbsd"* in the link library line. The function *strnstr* is only found 
the in the BSD library. 



## Input File Formats
The script builds the configuration by compiling four simple text files. 
Create these files in the same directory:

### 1. `talkgroups.inp`
*Template for the talkgroups applied to every digital repeater.*
```text
# TG name Timeslot Receive group Ref.no. Comment
Parrot 1 - 1 # Parrot
Norway 1 1 2 # Norway
```

### 2. `digital.repeaters.inp`
*List of your local or frequented DMR repeaters.*
```text
Name Callsign RxFreq TxOffset ColorCode
Oslo_DMR LA1B 434.5000 -2.0000 1
Bergen_DMR LA2G 434.9000 -2.0000 2
```

### 3. `analog.channels.inp`
*Analog channels grouped under geographical header markers (`#`).*
```text
# Simplex_FM
a Call-2m 145.5000 +0 High - 240 - - 1 - - 12.5
b Call-70cm 433.5000 +0 High - 240 - - 1 - - 12.5
# Oslo
a Tryvann 145.600 -0.6 High - 240 - Tone 1 123.0 123.0 12.5
b Follo 145.7875 -0.6 High - 240 - Tone 1 123.0 123.0 12.5
```

### 4. `contacts.inp`
*A static baseline file for essential static contacts/Talkgroups.*
```text
Contact Name Type ID RxTone
1 Disconnect Private 4000 +
2 Norway Group 242 +
```

### Real codeplut files
The files 
 - analog.channels.inp
 - digital.repeaters.inp
 - talkgroups.inp
 - contacts.inp
are real files used in my radios. 



## Usage
1. Open `make.codeplug` and verify your `RADIO`, `USER_ID`, and `CALLSIGN` 
configurations at the top of the script.
2. Run the script and redirect the output to a `.conf` file:
```bash
chmod +x make.codeplug
./make.codeplug > my_codeplug.conf
```
3. Flash it to your radio via `dmrconfig`:
```bash
# Read and backup first!
dmrconfig -r -o backup.img
# Write your newly generated codeplug
dmrconfig -c my_codeplug.conf
```

## Note on "Last Heard" Data Fetching
In earlier versions of the amateur radio DMR networks, a master flat-file 
containing a simple "Last Heard" active user dump was easily scrapable or 
exposed directly online. Due to architectural changes, database load 
restrictions, and optimizations on the Brandmeister network (migrating 
backend lookups ahead of time to master servers), these legacy raw text 
endpoints are no longer available or updated.

To circumvent this and still generate a highly relevant, localized user 
contact database, this script:
1. Queries the **RadioID.net** centralized registry dump combined 
with **Brandmeister API hooks** to fetch active registered users.
2. Uses localized regular expressions (Regex) in `Awk`/`Bash` to strictly 
target specific country prefixes (e.g., MCC `242` for Norway, `240` for Sweden, etc.).
3. Orders the resulting dataset to prioritize stations with recent active 
server interactions where data parameters match, filling up the maximum 
available digital contact slots on your radio with the hams you are most 
likely to encounter over the air.
