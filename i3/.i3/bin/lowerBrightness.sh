#!/bin/bash

if ! foobar_loc="$(type -p "$foobar_command_name")" || [ -z "$foobar_loc" ]; then
  backlight_file='/sys/class/backlight/intel_backlight/brightness'
  level=`cat "${backlight_file}"`
  let level-=100
  echo "${level}" > "${backlight_file}"
else
  xbacklight -dec 5
fi


$HOME/.i3/bin/showAlert.sh "Brightness: $($HOME/.i3/bin/getBrightness.sh)" middle 1
