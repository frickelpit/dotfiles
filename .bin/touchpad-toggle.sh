#!/bin/bash
 
synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0')
Touchpad=`synclient -l | grep -c 'TouchpadOff.*=.*0'`

if [ $Touchpad = 1 ]; then
   notify-send "Touchpad" "Touchpad eingeschaltet" 
else
   notify-send "Touchpad" "Touchpad ausgeschaltet"
fi
