#!/bin/sh

greenclip daemon &
xrandr --output HDMI-0 --mode 1920x1080 --rate 165 --rotate right
feh --bg-scale $HOME/.config/wallpapers/white.jpg
/usr/local/bin/slstatus &
exec /usr/local/bin/dwm
