function btcusd() {
	echo `curl -s https://api.bitcoinaverage.com/ticker/USD/last`
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
alias gpgd="gpg -d"
alias gpge="gpg -c"
alias hex="xxd -p"
alias la="ls -lAh --color=always"
alias ls="ls -A --color=always"
alias pacman-log="cat /var/log/pacman.log"
alias reboot="systemctl reboot"
alias shutdown="systemctl poweroff"
alias suspend="systemctl suspend"
alias tolower="tr '[:upper:]' '[:lower:]'"
alias toupper="tr '[:lower:]' '[:upper:]'"
alias vi="vim"
