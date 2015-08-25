#!/bin/sh


# Send the header so that i3bar knows we want to use JSON:
echo '{"version":1}'

# begin the endless array:
echo '['

# We send an empty first array of blocks to make loop simpler:
echo '[],'

# Now send blocks with information forever:
exec conky -c $HOME/.i3/conkyrc

