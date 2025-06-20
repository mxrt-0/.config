#!/bin/sh

col_white="#FFFFFF"
col_dark_grey="#3A3A3A"
col_light_grey="#BFBFBF"

greenclip print | grep . | dmenu -i -l 10 \
	-nb "$col_white" -nf "$col_dark_grey" \
	-sb "$col_white" -sf "$col_light_grey" \
	-fn 'FiraCode Nerd Font Mono-16:bold' | xargs -r -d'\n' -I '{}' greenclip print '{}'
