#!/bin/bash
#echo ${level} > /sys/class/backlight/radeon_bl0/brightness


#level=`cat /sys/class/backlight/radeon_bl0/brightness`
#let level+=10
#echo $level
#echo $level | sudo tee /sys/class/backlight/radeon_bl0/brightness
xbacklight -inc 5
$HOME/.i3/bin/showAlert.sh "Brightness: $(xbacklight | sed "s/\..*//")%" middle 1
