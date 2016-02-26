#!/bin/bash
sleep 1
nvidia-settings --load-config-only
sleep 1
compton --config $HOME/.compton.conf -b
