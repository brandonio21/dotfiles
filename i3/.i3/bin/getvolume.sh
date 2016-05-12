#/bin/bash
echo `amixer -D pulse get Master | egrep -o -m 1 "[0-9]+%"`
