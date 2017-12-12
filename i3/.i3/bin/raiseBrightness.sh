#!/bin/bash

if foobar="$(type -p "light")" && [ ! -z "light" ]; then
  light -l -A 5
elif foobar="$(type -p "xbacklight")" && [ ! -z "xbacklight" ]; then
  xbacklight -inc 5
else
  backlight_file='/sys/class/backlight/intel_backlight/brightness'
  level=`cat "${backlight_file}"`
  let level+=100
  echo "${level}" > "${backlight_file}"
fi


$HOME/.i3/bin/showAlert.sh "Brightness: $($HOME/.i3/bin/getBrightness.sh)" middle 1
