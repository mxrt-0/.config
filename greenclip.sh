#!/bin/sh

col_white="#FFFFFF"
col_black="#000000"
col_light_grey="#999999"
col_green="#00FF00"

greenclip print | grep . | dmenu -i -l 10 \
-nb "$col_black" -nf "$col_white" \
-sb "$col_black" -sf "$col_light_grey" \
-fn 'FiraCode Nerd Font Mono-16:bold' | xargs -r -d'\n' -I '{}' greenclip print '{}'
