#!/bin/bash

if foobar="$(type -p "light")" && [ ! -z "light" ]; then
  echo $(light -l -G | awk -F. '{print $1}')%
elif foobar="$(type -p "xbacklight")" && [ ! -z "xbacklight" ]; then
  echo $(xbacklight -get)
else
  backlight_file='/sys/class/backlight/intel_backlight/brightness'
  max_backlight_file='/sys/class/backlight/intel_backlight/max_brightness'
  level=`cat "${backlight_file}"`
  max_level=`cat "${max_backlight_file}"`
  pct=$(python -c "print(int(float(${level}) / float(${max_level}) * 100))")
  echo "${pct}"%
fi
