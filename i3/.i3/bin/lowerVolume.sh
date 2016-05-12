#!/bin/bash
volume=$(amixer -D pulse sset Master 5%- | egrep -o -m 1 "[0-9]+%")
`$HOME/.i3/bin/showAlert.sh "Volume: $volume" middle 1`

