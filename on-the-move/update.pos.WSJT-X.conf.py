#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Python script to collect the current GPS position from 
# Signal K and use it to update the MyGrid settings in the
# .ini files for WSJT-X and JS8Call.
#
# Adapted, collected and edited by Ole W. Saastad, LB4PJ
# 02 March 2023. 
# 25 March 2023, added support for gpsd. 

# Function "to_grid".
# Original code to request from Signal K - from user «Sailoog» at 
# openmarine forum.
# 
# Converting to grid, original code by Walter Underwood, K6WRU 
#
# Convert latitude and longitude to Maidenhead grid locators.
#
# Arguments are in signed decimal latitude and longitude. For example,
# the location of my QTH Palo Alto, CA is: 37.429167, -122.138056 or
# in degrees, minutes, and seconds: 37° 24' 49" N 122° 6' 26" W

upper = 'ABCDEFGHIJKLMNOPQRSTUVWX'
lower = 'abcdefghijklmnopqrstuvwx'

def to_grid(dec_lat, dec_lon):
    if not (-180<=dec_lon<180):
        sys.stderr.write('longitude must be -180<=lon<180, given %f\n'%dec_lon)
        sys.exit(32)
    if not (-90<=dec_lat<90):
        sys.stderr.write('latitude must be -90<=lat<90, given %f\n'%dec_lat)
        sys.exit(33) # can't handle north pole, sorry, [A-R]

    adj_lat = dec_lat + 90.0
    adj_lon = dec_lon + 180.0

    grid_lat_sq = upper[int(adj_lat/10)];
    grid_lon_sq = upper[int(adj_lon/20)];

    grid_lat_field = str(int(adj_lat%10))
    grid_lon_field = str(int((adj_lon/2)%10))

    adj_lat_remainder = (adj_lat - int(adj_lat)) * 60
    adj_lon_remainder = ((adj_lon) - int(adj_lon/2)*2) * 60

    grid_lat_subsq = lower[int(adj_lat_remainder/2.5)]
    grid_lon_subsq = lower[int(adj_lon_remainder/5)]

    return grid_lon_sq + grid_lat_sq + grid_lon_field + grid_lat_field + grid_lon_subsq + grid_lat_subsq
# End to_grid


def gpsdclient():
    import gps
    host='10.10.10.1' 
    port='2947'
    session = gps.gps(host=host, port=port,mode=gps.WATCH_ENABLE)
    while 0 == session.read() :
        if not (gps.MODE_SET & session.valid):
            # not useful, probably not a TPV message
            continue        
        if ((gps.isfinite(session.fix.latitude) and
             gps.isfinite(session.fix.longitude))):
            #print(" Lat %.6f Lon %.6f" %
            #      (session.fix.latitude, session.fix.longitude))
            return session.fix.latitude, session.fix.longitude
            break
    session.close()
# End gpsdclient
    
    
def signalkclient():
    import json, requests

# This is a demo address for SignalK
    resp = requests.get('http://demo.signalk.org:/signalk/v1/api/vessels/self/navigation/position/value', verify=False)

# Localhost    
    #resp = requests.get('http://localhost:3000/signalk/v1/api/vessels/self/navigation/position/value', verify=False)

# Specify a network SignalK server, insert your local SignalK server name or
# IP number and default port 3000
    #resp = requests.get('http://10.10.10.1:3000/signalk/v1/api/vessels/self/navigation/position/value', verify=False)
    
    if (resp.status_code == 404):
        exit(1)
        # Just exit if no valid response from the SignalK server.

    data = json.loads(resp.content)
    return float(data['latitude']), float(data['longitude'])
# End signalkclient


# Main start here,  convert lat long from signalK or gpsd to grid:

import sys, os

# Select source:
#lat, long = signalkclient()
lat, long = gpsdclient()

grid=to_grid(lat, long)
if len(grid) != 6 :
    print("Length differ from valid grid")	
    exit(1)

print("Updating ESJT-X, JS8Call & tsql grid from SignalK to new Grid: ",grid)
cmd="sed -i s/MyGrid=....../MyGrid="+grid+"/ $HOME/.config/WSJT-X.ini"
#print(cmd)
os.system(cmd)
cmd="sed -i s/MyGrid=....../MyGrid="+grid+"/ $HOME/.config/JS8Call.ini"
#print(cmd)
os.system(cmd)
cmd="sed -i s/'GRIDSQUARE>JO....'/'GRIDSQUARE>'"+grid+"/ $HOME/.tqsl/station_data"
#print(cmd)
os.system(cmd)
print("Grid updated:", grid)


