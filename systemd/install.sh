#!/bin/bash
sudo cp * /etc/systemd/system
sudo systemctl daemon-reload
printf "Installed. Remember to enable all units\n"
