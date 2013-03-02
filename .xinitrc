#!/bin/bash

xmodmap -e 'keycode 23 = Tab'
feh --bg-fill `find ~/Downloads/ -regex ".+\.\(jpg\|png\)" | sort --random-sort | head -1`

while true; do
	xsetroot -name "$(date +"%a %d/%m/%y | %H:%M:%S") $(acpi -b | awk 'sub(/,/,"") {print $3, $4}')"
	sleep 1
done &

exec dwm
