function btcusd() {
	echo `curl -s http://api.bitcoinaverage.com/ticker/USD | sed -n 3p | tr -d ',' | awk '{ print $2 }' | head -c 5`
}

function pw() {
	echo `cat /dev/urandom | base64 | head -c $1`
}

alias diff="colordiff"
alias du="du -d 1"
alias feh="feh --auto-zoom --scale-down --image-bg black"
alias hex="xxd -p"
alias la="ls -lAh --color=always"
alias ls="ls -A --color=always"
alias pacman-log="cat /var/log/pacman.log"
alias reboot="systemctl reboot"
alias shutdown="systemctl poweroff"
alias suspend="systemctl suspend"
alias vi="vim"
