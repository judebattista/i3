#!/bin/bash
# Get the id for the touchpad
tpid=`xinput list | grep -i touchpad | awk '{print $6}' | sed 's/id=//'`

# Find out whether the touchpad is enabled or not
tpenabled=`xinput list-props $tpid | grep Device\ Enabled | awk '{print $4}'`

# toggle
if [ $tpenabled = 0 ]
then
    # touchpad is disabled so turn it on
    xinput set-prop $tpid "Device Enabled" 1
    echo "Touchpad is now on."
elif [ $tpenabled = 1 ]
then
    # touchpad is enabled to turn it off
    xinput set-prop $tpid "Device Enabled" 0
    echo "Touchpad is now off."
else
    echo "tptoggle: Could not get touchpad status from xinput."
    exit 1
fi

