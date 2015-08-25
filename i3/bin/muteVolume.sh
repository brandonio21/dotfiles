#!/bin/bash
if [[ $(amixer get Master | egrep -o -m 1 "[[a-z]+]" | egrep -o -m 1 "[a-z]+") == "off" ]]; then
	`amixer set Master unmute`
	`amixer set Headphone unmute`
	`amixer set Speaker unmute`
	`$HOME/.i3/bin/showAlert.sh "Volume: $(amixer get Master | egrep -o -m 1 "[0-9]+%")" middle 1`
else
	`amixer set Master mute`
	`amixer set Headphone mute`
	`amixer set Speaker mute`
	`$HOME/.i3/bin/showAlert.sh "Volume: MUTED" middle 1`
fi
