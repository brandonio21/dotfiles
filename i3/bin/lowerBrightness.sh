#!/bin/bash
#echo ${level} > /sys/class/backlight/radeon_bl0/brightness


#level=`cat /sys/class/backlight/radeon_bl0/brightness`
#let level-=10
#echo $level
#echo $level | sudo tee /sys/class/backlight/radeon_bl0/brightness
if [ $(xbacklight | sed "s/\..*//") -lt "10" ]; then
	xbacklight -set 5
else
	xbacklight -dec 5
fi
$HOME/.i3/bin/showAlert.sh "Brightness: $(xbacklight | sed "s/\..*//")%" middle 1
