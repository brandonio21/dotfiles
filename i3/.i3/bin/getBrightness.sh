#!/bin/bash

if ! foobar_loc="$(type -p "$foobar_command_name")" || [ -z "$foobar_loc" ]; then
  backlight_file='/sys/class/backlight/intel_backlight/brightness'
  max_backlight_file='/sys/class/backlight/intel_backlight/max_brightness'
  level=`cat "${backlight_file}"`
  max_level=`cat "${max_backlight_file}"`
  pct=$(python -c "print(int(float(${level}) / float(${max_level}) * 100))")
  echo "${pct}"%
else
  echo $(xbacklight -get)
fi


