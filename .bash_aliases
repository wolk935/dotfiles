function btcusd() {
	echo "scale=2; 1/" `curl -s "https://blockchain.info/tobtc?currency=USD&value=1"` | bc -l
}

function pw() {
	echo `cat /dev/urandom | base64 | head -c $1`
}

alias diff="colordiff"
alias feh="feh --scale-down"
alias hex="xxd -p"
alias la="ls -lah --color=always"
alias ls="ls -a --color=always"
alias pacman-log="cat /var/log/pacman.log"
alias reboot="systemctl reboot"
alias shutdown="systemctl poweroff"
alias suspend="systemctl suspend"
alias vi="vim"
