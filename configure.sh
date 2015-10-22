#!/usr/bin/env bash

wirelessCard=$(ifconfig -s | cut -d " " -f 1 | egrep "w.+")
ethernetCard=$(ifconfig -s | cut -d " " -f 1 | egrep "e.+")
cp i3/.i3/conkyrc.template i3/.i3/conkyrc
sed "s/WIRELESS_CARD/${wirelessCard}/g" -i i3/.i3/conkyrc
sed "s/ETHERNET_CARD/${ethernetCard}/g" -i i3/.i3/conkyrc
