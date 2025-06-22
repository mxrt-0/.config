#!/bin/sh

col_black="#000000"
col_pale_yellow="#FFFFEA"
col_dark_yellow_green="#99994C"
font="BigBlueTerm437NerdFontMono:weight=bold:size=15"

greenclip print | grep . | dmenu -i -l 10 \
	-nb "$col_pale_yellow" -nf "$col_black" \
	-sb "$col_pale_yellow" -sf "$col_dark_yellow_green" \
	-fn "$font" | xargs -r -d'\n' -I '{}' greenclip print '{}'
