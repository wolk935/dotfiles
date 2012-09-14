xloadimage -onroot -fullscreen `find ~/Downloads/ -name "*.jpg" | sort --random-sort | head -1` 

while true; do
	xsetroot -name "$(date +"%F %R")"
	sleep 1m
done &

exec dwm
