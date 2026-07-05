# Winlink ports 
Winlink uses DOS COM ports for communication.

To make sure the /dev/tty ports are set com correcr port one can
use the port's identification using  /dev/serial/by-id/
This avoid the issue where /dev/ttyACM0 or ttyACM1 gets assigned to PMR-171. 

In the case of PMR-171 : /dev/serial/by-id/usb-GHDZ_Community_USB_PMR-171_00000000002A-if00
This make sure that whatever port get assigned ttyACM0 or ttyACM1 etc will always get
assigned to the one that the radio is assgned to.

Newer versions of Winlink do not have options beoynd com32 (VARA HF) and com16 (VARA FM),
Hence the choice of com16 and com32.


## This is a smart way of setting com16 and com32
```
wine regedit

HKEY_LOCAL_MACHINE
Software
Wine
Ports

New
StringValue
name com32
/dev/serial/by-id/usb-GHDZ_Community_USB_PMR-171_00000000002A-if00
```
and similar for com16.








