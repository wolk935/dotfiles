function aes256cbcc() {
	openssl aes-256-cbc -e -in $1 -out $1.aes
}

function aes256cbcd() {
	openssl aes-256-cbc -d -in $1 -out `basename --suffix .aes $1`
}

function hist10() {
	cat ~/.bash_history | sort | uniq -c | sort -n | tail -n10
}

function myip() {
	curl -s http://checkip.dyndns.org/ | grep -Eo '\<[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}\>'
}

function max() {
	echo -en "$*" | tr " " "\n" | sort -gr | head -n1
}

function min() {
	echo -en "$*" | tr " " "\n" | sort -g | head -n1
}

function prepend() {
	cat - $1 <<< $2 > /tmp/prepend$$.tmp && mv /tmp/prepend$$.tmp "$1"
}

function pw() {
	echo `cat /dev/urandom | base64 | head -c $1`
}

function randomMAC() {
	ip link set dev $1 down
	ip link set dev $1 address `hexdump -n3 -e'/3 "00:60:2F" 3/1 ":%02X"' /dev/urandom`
	ip link set dev $1 up
}

function wpw() {
	shuf --random-source=/dev/urandom -n$1 /usr/share/dict/cracklib-small | tr '\n' ' '
}

alias diff="colordiff"
alias df="df -h"
alias du="du -hd 1"
alias feh="feh --auto-zoom --image-bg black --scale-down"
alias gpgc="gpg -cq"
alias gpgd="gpg -dq"
alias grep="grep --color -I"
alias hex="od -A n -x | tr -d ' \n'"
alias la="ls -lAh --color=auto"
alias ls="ls -A --color=auto"
alias less="less --no-init --raw-control-chars --quit-if-one-screen"
alias npm="npm --python=/usr/bin/python2.7"
alias reboot="systemctl reboot"
alias shutdown="systemctl poweroff"
alias suspend="systemctl suspend"
alias tolower="tr '[:upper:]' '[:lower:]'"
alias toupper="tr '[:lower:]' '[:upper:]'"
alias vi="vim"
