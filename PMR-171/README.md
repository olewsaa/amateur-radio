# PMR-171
## Introduction

In many respect the PMR-171 is very similar to the Q900. The firmware
interface look very similar. With updated firmware both readios can
be programmed with the *GHTerminal* program.

### DMR
This transceiver can be purchased with DMR support. It do not have
zones as radios like Baofeng DM1701, but each repeater and associated 
talk groups is a channel. With room for only 1000 channels this can soon
be too few. Number of repeaters times number of talkgroups can easily 
reach 1000+ entries. 

The script "make-config-Guohetec" can be used to generate a config file 
that ran be read by the "GHTerminal" CPE program.

### Script 

To use the script some input files files are needed.

- analog.channels.inp
- digital.repeaters.inp
- talkgroups.inp
- contacts.inp

The just run:
```Terminal
./make-config-Guohetec
```
This will generate a JSON file that can be read in by the GHTerminal program.
In the case where only analog channels are to be configured adding the option
"-no-DMR" can be used.
```Terminal
./make-config-Guohetec -no-DMR
```



