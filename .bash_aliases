function aes256cbcc() {
	openssl aes-256-cbc -e -in $1 -out $1.aes
}

function aes256cbcd() {
	openssl aes-256-cbc -d -in $1 -out `basename --suffix .aes $1`
}

function btcaddrbal() {
	echo `curl -s https://blockchain.info/q/addressbalance/$1`
}

function btcusd() {
	echo `curl -s https://api.bitcoinaverage.com/ticker/USD/last`
}

function hist10() {
	cat ~/.bash_history | sort | uniq -c | sort -n | tail -n10
}

function myip() {
	curl -s http://checkip.dyndns.org/ | grep -Eo '\<[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}\>'
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
	shuf --random-source=/dev/urandom -n$1 /usr/share/dict/cracklib-small 
}

alias diff="colordiff"
alias df="df -h"
alias du="du -hd 1"
alias feh="feh --auto-zoom --scale-down --image-bg black"
alias gpgc="gpg -cq"
alias gpgd="gpg -dq"
alias hex="od -A n -x | tr -d ' \n'"
alias la="ls -lAh --color=always"
alias ls="ls -A --color=always"
alias rand="cat /dev/random"
alias reboot="systemctl reboot"
alias shutdown="systemctl poweroff"
alias suspend="systemctl suspend"
alias tolower="tr '[:upper:]' '[:lower:]'"
alias toupper="tr '[:lower:]' '[:upper:]'"
alias urand="cat /dev/urandom"
alias vi="vim"
