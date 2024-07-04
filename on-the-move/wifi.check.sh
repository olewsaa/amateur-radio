#!/bin/bash

# Script to facilitate access to OpenPlotter accesspoint
# when system is connected to another accesspoint. This
# script select the other access point (f.eks openplotter)
# while coes that need the openplotter server's services,
# and hand it over to the original access point after.
# If already at correct access point the calls are issued
# with further action.
#
# 
#
# Ole W. Saastad
# Ver. 0.1  16 Sept. 2023 Initial version. 
# Ver. 0.11 18 Sept. 2024 Added home check.

# This is the place where calls to the openplotter server
# can be done. At this point we known that openplotter is
# reachable.

function OP() {
    #/home/ole/Python/QTH-dummy.py >> wifi.log
    /home/ole/bin/update.QTH >> wifi.log
    if [ $? == 0 ]; then
	#notify-send "Updated grid" $AP
	zenity --info --text="Updated QTH, Connected to accesspoint: "$AP\
	       --timeout=4
    else
	#notify-send "Failed to update", $AP
	zenity --info --text="Failed, Accesspoint: "$AP 
    fi
}

# Start here
zenity --info --text="Starting....wait......"  --timeout=1

echo "Start" > wifi.log
chown ole wifi.log
# Are we at home ? This is a laptop on the move.
wpa_cli list_networks 2>/dev/null | grep Team | grep CURRENT 
if [ $? == 0 ]; then
    echo " We're at home, done" >> wifi.log
    # Call bash function OP work done here and we're done.
    AP=$(wpa_cli list_networks | grep CURR | cut -f2)
    OP
    exit 0 # We're done.
else:
    echo "unknown"  >> wifi.log
fi
exit 0

# Enter the wifi SSID/name for the wlan that host the openplotter server.
TARGET="TeamrocketHQ5"


echo "Target accesspoint is: "$TARGET  >> wifi.log
echo "List networks, check if target is listed"  >> wifi.log
wpa_cli  list_networks 2>/dev/null | grep $TARGET  >/dev/null
if [ $? != 0 ]; then echo "Not availble, exit" >> wifi.log;  exit 1; fi
TARGETID=$(wpa_cli   list_networks | grep $TARGET| cut -f 1)
echo "Target ID "$TARGETID >> wifi.log;
echo -n "Are we connected to "${TARGET}" ?" >> wifi.log;
wpa_cli  list_networks | grep $TARGET |grep CURRENT  >/dev/null
if [ $? == 0 ]; then 
    echo " Yes, Attached to target, done"  >> wifi.log;
    # Call bash functio n OP work done here and we're done.
    OP
    exit 0 # We're done.
fi

notify-send -t 2000 "Changing access point"
# We need to change accesspoint to reach the relevnt server.  
echo " No - not connected to target!"
echo "Need to change associated to target accesspoint"
echo -n "Scan for networks "
ret=$(wpa_cli  scan 2&1>/dev/null)
#echo "Return "$ret
# Most if the wpa_cli commands return OK or an error message
# if not ok, ideally one should run a while construct to
# ensure that an OK is returned befor continueing. Fortunately
# it does not happen very often, so fingers crossed, this is not
# a spaceship. 
wpa_cli  scan_results | grep $TARGET >/dev/null
if  [ $? != 0 ]; then 
	echo "No access point named "$TARGET" found, exiting"  >> wifi.log;
	exit 1
fi
echo -n "Find current ID "  >> wifi.log;
CURRENTID=$(wpa_cli  list_networks | grep CURRENT| cut -f 1)
echo  $CURRENTID  >> wifi.log

ret=$(wpa_cli  list_networks | grep CURRENT)
echo $ret  >> wifi.log 
#echo $TARGETID 
#echo $CURRENTID
ret=$(wpa_cli  disable  $CURRENTID) 
sleep 1
ret=$(wpa_cli  enable  $TARGETID)
sleep 3
ret=$(wpa_cli  list_networks | grep CURRENT)
echo $ret >> wifi.log
# Call script that need to connect to OpenPlotter using bash function OP:
notify-send -t 2000 $(wpa_cli list_networks | grep CURR | cut -f2)
OP  
# Connecting back to original access point 
ret=$(wpa_cli  disable $TARGETID)
sleep 1
ret=$(wpa_cli  enable $CURRENTID)
sleep 3
ret=$(wpa_cli  list_networks | grep CURRENT)
echo $ret  >> wifi.log
exit 0


