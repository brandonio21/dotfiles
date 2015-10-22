#!/usr/bin/env bash

# Move the template to the actual conkyrc file
cp i3/.i3/conkyrc.template i3/.i3/conkyrc

# Replace the wireless card for the conky configuration
wirelessCard=$(ifconfig -s | cut -d " " -f 1 | egrep "w.+")
ethernetCard=$(ifconfig -s | cut -d " " -f 1 | egrep "e.+")
sed "s/WIRELESS_CARD/${wirelessCard}/g" -i i3/.i3/conkyrc
sed "s/ETHERNET_CARD/${ethernetCard}/g" -i i3/.i3/conkyrc
