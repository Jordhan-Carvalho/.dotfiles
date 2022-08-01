#!/usr/bin/env bash
img=/tmp/i3lock.png

# Take a screenshot
scrot -o $img
# Pixellate it 10x
convert $img -scale 10% -scale 1000% $img

# Lock the screen
i3lock -u -e -i $img

# Turn the screen off after a delay.
sleep 60; pgrep i3lock && xset dpms force off
