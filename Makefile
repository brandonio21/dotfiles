default:
	wirelessCard=$(ifconfig -s | cut -d " " -f 1 | egrep "w.+")
	ethernetCard=$(ifconfig -s | cut -d " " -f 1 | egrep "e.+")
	sed "s/WIRELESS_CARD/${wirelessCard}/g" -i $HOME/.i3/conkyrc
	sed "s/ETHERNET_CARD/${ethernetCard}/g" -i $HOME/.i3/conkyrc
