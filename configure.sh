#!/usr/bin/env bash

# Move the template to the actual conkyrc file
cp i3/.i3/conkyrc.template i3/.i3/conkyrc

# Get fonts
git clone https://github.com/powerline/fonts
fonts/install.sh
rm -rf fonts

# Replace the wireless card for the conky configuration
wirelessCard=$(ip link | egrep "[0-9]+: .+: " | cut -d " " -f 2 | egrep "w.+")
ethernetCard=$(ip link | egrep "[0-9]+: .+: " | cut -d " " -f 2 | egrep "e.+")
if [[ $ethernetCard == "" ]]; then
	ethernetCard="enp:"
fi
sed "s/WIRELESS_CARD/${wirelessCard%?}/g" -i i3/.i3/conkyrc
sed "s/ETHERNET_CARD/${ethernetCard%?}/g" -i i3/.i3/conkyrc

numMonitors=$(xrandr --current | grep " connected" | wc -l)
if [ $numMonitors -gt 1 ]; then
	cat i3/.i3/config.desktop > i3/.i3/config
else
	cat i3/.i3/config.laptop > i3/.i3/config
fi

