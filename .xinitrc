#!/bin/bash

feh --bg-fill `find ~/Downloads/wallpapers -regex ".+\.\(jpg\|png\)" | sort --random-sort | head -1`

for (( i = 0;; ++i )); do
	if (( i % 30 == 0 )); then
		btcusd=$(curl -s http://api.bitcoinaverage.com/ticker/USD | sed -n 3p | tr -d ',' | awk '{ print $2 }')
	fi

	lsop=$(lsof -nPi | tail -n+2 | tr ':' ' ' | awk '{ print $11 }' | sort | uniq -c | tr -d '\n' | tr -s ' ')
	dtime=$(date +"%c")

	xsetroot -name "$lsop | $btcusd USD | $dtime"
	sleep 1
done &

exec dwm
