#!/bin/bash
songArtistGrep=".*"

artist=$(echo `dbus-send --print-only --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' |egrep -A 2 "artist"|egrep -v "artist"|egrep -v "array"|cut -b 27-|cut -d '"' -f 1|egrep -v ^$` "-" `dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | egrep -A 3 "artist"` | egrep -o "\[ string \"$songArtistGrep+\" \]" | egrep -o "\"$songArtistGrep+\"" | sed "s/\"//g")
title=$(echo `dbus-send --print-only --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' |egrep -A 2 "artist"|egrep -v "artist"|egrep -v "array"|cut -b 27-|cut -d '"' -f 1|egrep -v ^$` "-" `dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'` | egrep -o "xesam:title\" variant string \"$songArtistGrep+\"" | sed "s/\"//"  | egrep -o "\"$songArtistGrep+\"" | sed "s/\"//g" | sed "s/ ) dict entry.*//")
echo $artist - $title

