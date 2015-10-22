#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

numMonitors=$(xrandr --current | grep " connected" | wc -l)
if [ $numMonitors -gt 1 ]; then
	cat $HOME/.i3/config.desktop > $HOME/.i3/config
else
	cat $HOME/.i3/config.laptop > $HOME/.i3/config
fi

exec i3
