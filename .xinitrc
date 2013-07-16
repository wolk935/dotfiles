#!/bin/bash

feh --bg-fill `find ~/Downloads/wallpapers -regex ".+\.\(jpg\|png\)" | sort --random-sort | head -1`

while true; do
	lsop=$(lsof -nPi | tail -n+2 | tr ':' ' ' | awk '{ print $11 }' | sort | uniq -c | tr -d '\n' | tr -s ' ')
	dtime=$(date +"%c")

	xsetroot -name "$lsop | $dtime"
	sleep 1
done &

exec dwm
