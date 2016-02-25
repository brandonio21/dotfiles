#!/bin/bash
sleep 1
nvidia-settings --load-config-only
sleep 1
compton $HOME/.compton.conf -b
