function btcusd() {
	echo "scale=2; 1/" `curl -s "https://blockchain.info/tobtc?currency=USD&value=1"` | bc -l
}

function pw() {
	echo `cat /dev/urandom | base64 | head -c $1`
}

alias cp="rsync -P"
alias diff="colordiff"
alias du="du -d 1"
alias feh="feh --scale-down"
alias hex="xxd -p"
alias la="ls -lAh --color=always"
alias ls="ls -A --color=always"
alias mv="rsync -P --remove-sent-files" 
alias pacman-log="cat /var/log/pacman.log"
alias reboot="systemctl reboot"
alias shutdown="systemctl poweroff"
alias suspend="systemctl suspend"
alias vi="vim"
