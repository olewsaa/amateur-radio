#!/bin/bash

# This is the parameters given to the gen.sh script. Most of these come from
# the input info.for.gen.

export number=$1
export name=$2
export call=$3
export freq=$4
export offset=$5
export color=$6

echo $slot 
echo "#"
echo "# " $2 $3
#
# awk script to print and format the input. With some constants and shortcuts.
awk 'BEGIN{number=ENVIRON["number"]} 
    {printf("  %d\t%-8s\t%s\t%s\tHigh  - \t%s  %s \t%s \t%s \t%s \t%s \t%s \t%s %s\n",\
    number++, 			     # Label number, increase with each line\
    $2, 			     # Talkroom\
    ENVIRON["freq"], 		     # Frequency\
    ENVIRON["offset"],		     # Offset \
    $7,				     # Power\
    $8,			     	     # default\
    $9,				     # Maxtime\
    ENVIRON["color"],		     # Color\
    $11,			     # color number\
    $12,			     # Slot number\
    $13,			     # RX\
    $14,			     # Talkgrouop\
    $15)			     # Comment
    }' tgtemplate
echo "#"
