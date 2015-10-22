#/bin/bash
echo `amixer  get Master | egrep -o -m 1 "[0-9]+%"`
