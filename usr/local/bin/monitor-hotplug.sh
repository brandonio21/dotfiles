#!/bin/bash

#Adapt this script to your needs.
DEVICES=$(xrandr | tail -n +2 | egrep '^\w')

#inspired by /etc/acpd/lid.sh and the function it sources

if [ -z $DISPLAY ]; then
  displaynum=`ls /tmp/.X11-unix/* | sed s#/tmp/.X11-unix/X##`
  display=":$displaynum.0"
  export DISPLAY=":$displaynum.0"
fi

# from https://wiki.archlinux.org/index.php/Acpid#Laptop_Monitor_Power_Off
if [ -z $XAUTHORITY ]; then
  export XAUTHORITY=$(ps -C Xorg -f --no-header | sed -n 's/.*-auth //; s/ -[^ ].*//; p')
fi


#this while loop declare the $HDMI1 $VGA1 $LVDS1 and others if they are plugged in
while read l
do
  dir=$(echo $l | awk '{print $1}')
  status=$(echo $l | awk '{print $2}')
  dev=$(echo $dir | sed 's/-/_/g');

  #Special case: If the display is DP-(2+x), it's actually DP-2-x
  num=$(echo $dev | cut -d\_ -f 3-)
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

if [ "$(hostname)" == "bmiltonlenovo" ]; then
  if [ ! -z "$eDP_1" -a ! -z "$DP_2_1" ] 
  then
    echo "eDP-1 and DP-2-1 are plugged in"
    xrandr --output eDP-1 --auto --primary --output DP-2-1 --auto --left-of eDP-1
  elif [ ! -z "$eDP_1" -a -z "$DP_2_1" ]
  then
    echo "eDP-1 is plugged in, but not DP-2-1"
    xrandr --output eDP-1 --auto --primary --output DP-2-1 --off
  fi
elif [ "$(hostname)" == "r4-arch" ]; then
  if [ ! -z "$DVI_D_0" -a ! -z "$HDMI_0" ]
  then
    echo "DVI-D-0 and HDMI-0 are plugged in"
    xrandr --output HDMI-0 --rotate normal --auto --primary --output DVI-D-0 --rotate left --auto --left-of HDMI-0
  elif [ ! -z "$HDMI_0" -a -z "$DVI_D_0" ]
  then
    echo "HDMI-0 is plugged in, but not DVI-D-0"
    xrandr --output HDMI-0 --rotate normal --auto --primary --output DVI-D-0 --off
  fi
fi

setxkbmap -option caps:escape
