#!/bin/bash

# Script to generate input for the dmrconfig.



# The digital entries and talkgroups.
# The talkgroups are found in the mal (template).

# List of digital channels start at 200.
start=200
info=$(head -2 info.for.gen| tail -1)

entries=$(cat info.for.gen | wc -l)
entries=$((entries -1))

for n in  $(seq 2 $entries); do
    info=$(head -$n info.for.gen| tail -1)
    ./gen.sh $start $info 
    incr=$(cat tgtemplate | wc -l)
    start=$((start + incr))
done


# The list of zones with channels and talkgroups.
#
# Number of analog entries need to be known.
#
numanalog=2

start=200
for n in  $(seq 2 $entries); do
    export zone=$((n + numanalog -1))
    info=$(head -$n info.for.gen| tail -1)
    echo $info | awk '{printf("%4s%c", ENVIRON["zone"],"a")}'
    echo $info | awk '{printf("\t%-10s\t",$1)}'
    echo $start"-"$((start + 5))
    echo $info | awk '{printf("%4s%c \t%c\t\t",ENVIRON["zone"],"b", "-")}'
    tgs=$(cat  tgtemplate | wc -l)
    echo $((start + 6))"-"$((start + tgs -1))
#    echo $start,  $entries  
    incr=$(cat tgtemplate | wc -l)
    start=$((start+ incr))
done
