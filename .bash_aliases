function btcaddrbal() {
	echo `curl -s https://blockchain.info/q/addressbalance/$1`
}

function btcusd() {
	echo `curl -s https://api.bitcoinaverage.com/ticker/USD/last`
}

function hist10() {
	cat .bash_history | sort | uniq -c | sort | tail -n10
}

function myip() {
	curl -s http://checkip.dyndns.org/ | grep -Eo '\<[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}\>'
}

function pw() {
	echo `cat /dev/urandom | base64 | head -c $1`
}

function wpw() {
	shuf --random-source=/dev/urandom -n$1 /usr/share/dict/cracklib-small 
}

alias diff="colordiff"
alias df="df -h"
alias du="du -hd 1"
alias feh="feh --auto-zoom --scale-down --image-bg black"
alias gpgc="gpg -c"
alias gpgd="gpg -d"
alias hex="xxd -p"
alias la="ls -lAh --color=always"
alias ls="ls -A --color=always"
alias reboot="systemctl reboot"
alias shutdown="systemctl poweroff"
alias suspend="systemctl suspend"
alias tolower="tr '[:upper:]' '[:lower:]'"
alias toupper="tr '[:lower:]' '[:upper:]'"
alias vi="vim"
