#!/bin/bash
sleep 1
if hash nvidia-settings 2>/dev/null; then
	nvidia-settings --load-config-only
fi
sleep 1
compton --config $HOME/.compton.conf -b
