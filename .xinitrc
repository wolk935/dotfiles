#!/bin/bash

pm-powersave true
conky --daemonize
feh --bg-fill `find ~/Downloads/wallpapers -regex ".+\.\(jpg\|png\)" | sort --random-sort | head -1`

while true; do
	xsetroot -name "$(date +"%c") $(acpi -b | awk 'sub(/,/,"") {print $3, $4}')"
	sleep 1
done &

exec dwm
