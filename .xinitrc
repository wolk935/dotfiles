#!/bin/bash

source .bash_aliases

# disable caps lock, set as CTRL
setxkbmap -option ctrl:nocaps

# faster key repeat rate
xset r rate 200 40

# random wallpaper
feh --bg-fill `find ~/Downloads/wallpapers -regex ".+\.\(jpg\|png\)" | sort --random-sort | head -1`

for (( i = 0;; ++i )); do
	battery=$(acpi -b | tr -d ',' | awk '{print $4 " " $3}')
	dtime=$(date +"%a %b %d %T")
	ipaddr=$(ip -o -4 addr | awk '{ print $4 }' | tail -n1)
	lsop=$(ss -natu | tail -n+2 | tr ':' ' ' |  awk '{ print $8 }' | sort | uniq -c | tr -d '\n' | tr -s ' ')
	memory=$(free -m | awk 'NR==2 {print $4}')

	xsetroot -name "$lsop | $ipaddr | $battery | ${memory}M | $dtime"
	sleep 1
done &

exec dwm
