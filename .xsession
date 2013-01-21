#!/bin/bash

xloadimage -onroot -fullscreen `find ~/Downloads/ -regex ".+\.\(jpg\|png\)" | sort --random-sort | head -1`

while true; do
	xsetroot -name "$(date +"%d/%m/%y %R") $(acpi -b | awk 'sub(/,/,"") {print $3, $4}')"
	sleep 1m
done &

exec dwm
