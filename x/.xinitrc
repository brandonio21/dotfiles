#!/bin/sh

userresources=$HOME/.Xresources
userresources_hidpi=$HOME/.Xresources_hidpi
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Remap capslock to esc
setxkbmap -option caps:escape

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

monitor_res=$(xrandr --listmonitors | egrep -o "x[0-9]+" | sed 's/x//' | head -1)
if [ $monitor_res -gt 1080 ]; then
  xrandr --dpi 190

  if [ -f $userresources_hidpi ]; then
    xrdb -merge $userresources_hidpi
  fi
fi

exec i3
