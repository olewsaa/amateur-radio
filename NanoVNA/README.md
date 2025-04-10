# NanoVNA

## introduction
The pocket sized NanoVNA is an excellent tool. The USB-C connection
enable it to be controlled from a laptop using a Linux software called
[nanovna-saver](https://nanovna.com/?page_id=90). While an excellent 
tool for controlling the NanoVNA and collecting data its plotting
functions leaves a bit to improve, it saves the file a common standard
[touchstone format](https://en.wikipedia.org/wiki/Touchstone_file). 

## Plotting data
The Python script included are one that only does SWR and Z while the
other include code to plot and display Smith diagrams. The latter need
*scikit-rf* which is not needed to just display SWR or Z. Hence two
scripts. Both script write the plot to disk as a .png file. File name
is same as input file name (with path) with a .png extension.
It also diplay the amateur radio bands as stripes. While this 
only apply for the HF(MF) band the scripts can handle frequencies both 
lower and higher than the HF (3-30 MHz).

The syntax is standard C applications : *swr-Z <SWR|Z> <filename.s1p>* or
*swr-z-s <SWR|Z|S> <filename.s1p>* 

It's an executable (starting with '#!/usr/bin/env python3').

Invoking without parameters it will print out a usage text. 



