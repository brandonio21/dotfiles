#!/bin/bash
if [ ! -d ~/.config/systemd/user ]; then
	mkdir -p ~/.config/systemd/user
fi

if [ ! -d /etc/systemd/system ]; then
	sudo mkdir -p /etc/systemd/system
fi

cp user/* ~/.config/systemd/user
sudo cp system/* /etc/systemd/system

printf "Installed. Remember to enable all units\n"
