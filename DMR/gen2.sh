#!/bin/bash
#!/bin/bash

# This is the parameters given to the gen2.sh script. Most of these come from
# the input info.for.gen.

# This is the input file containing the talkgroups
# to be includer for each repeater.

TG_INPUT_FILE=talkgroups.inp

export number=$1
export name=$2
export call=$3
export freq=$4
export offset=$5
export color=$6

#echo $slot 
echo "# " $2 $3
#
# awk script to print and format the input. With some constants and shortcuts.
#
# Use sed to remove any blank lines in the talkgroup template file.

tail +2 $TG_INPUT_FILE | awk '\
    BEGIN{number=ENVIRON["number"]}\
    {
      printf("  %d\t  %-15s\t %s\t %-4s  High - 240 - Color  %s  %s\t%s\t%s\t%s %s\n",
      number++ ,      	      # Talkgroup sequencr number \
      $1,      		      # Timeslot\
      ENVIRON["freq"],	      # Frequency\
      ENVIRON["offset"],      # Frequwency offset\
      ENVIRON["color"],	      # Codeword color\
      $2,		      # Color code\
      $3,		      # Receive group\
      $4,		      # Sequence number\
      $5,		      # Comment character\
      $6)		      # Name of talkgroup comment\
   }'
echo "#"
