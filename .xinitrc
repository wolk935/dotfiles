#!/bin/bash

pm-powersave true
feh --bg-fill `find ~/Downloads/wallpapers -regex ".+\.\(jpg\|png\)" | sort --random-sort | head -1`

while true; do
	xsetroot -name "$(lsof -nPi | tail -n+2 | tr ':' ' ' | awk '{ print $11 }' | sort | uniq -c | tr -d '\n' | tr -s ' ') | $(date +"%c") | $(acpi -b | awk '{print $3$4}' | tr ',' ' ')"
	sleep 1
done &

exec dwm
