#!/bin/bash

#Adapt this script to your needs.

DEVICES=$(find /sys/class/drm/*/status)

#inspired by /etc/acpd/lid.sh and the function it sources

displaynum=`ls /tmp/.X11-unix/* | sed s#/tmp/.X11-unix/X##`
display=":$displaynum.0"
export DISPLAY=":$displaynum.0"

# from https://wiki.archlinux.org/index.php/Acpid#Laptop_Monitor_Power_Off
export XAUTHORITY=$(ps -C Xorg -f --no-header | sed -n 's/.*-auth //; s/ -[^ ].*//; p')


#this while loop declare the $HDMI1 $VGA1 $LVDS1 and others if they are plugged in
while read l
do
  dir=$(dirname $l);
  status=$(cat $l);
  dev=$(echo $dir | cut -d\- -f 2- | sed 's/-/_/g');

  #Special case: If the display is DP-(2+x), it's actually DP-2-x
  num=$(echo $dev | cut -d\_ -f 2-)
  if [[ $num -gt 2 ]]
  then
    dev=$(echo $dev | sed "s/_.*/_2_$(expr $num - 2)/")
  fi

  if [ "connected" == "$status" ]
  then
    echo $dev "connected"
    declare $dev="yes";
  fi
done <<< "$DEVICES"

if [ ! -z "$eDP_1" -a ! -z "$DP_2_1" ]
then
  echo "eDP-1 and DP-2-1 are plugged in"
  xrandr --output eDP-1 --auto --primary --output DP-2-1 --auto --left-of eDP-1
  feh --bg-fill --randomize /home/bmilton/wallpapers
elif [ ! -z "$eDP_1" -a -z "$DP_2_1" ]
then
  echo "eDP-1 is plugged in, but not DP-2-1"
  xrandr --output eDP-1 --auto --primary --output DP-2-1 --off
  feh --bg-fill --randomize /home/bmilton/wallpapers
fi
