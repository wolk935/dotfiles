#!/bin/bash

pm-powersave true
conky --daemonize
xmodmap -e 'keycode 23 = Tab'
feh --bg-fill `find ~/Downloads/ -regex ".+\.\(jpg\|png\)" | sort --random-sort | head -1`

while true; do
	xsetroot -name "$(date +"%c") $(acpi -b | awk 'sub(/,/,"") {print $3, $4}')"
	sleep 1
done &

exec dwm
