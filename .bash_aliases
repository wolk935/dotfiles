function btcusd() {
	echo "scale=2; 1/" `curl -s "https://blockchain.info/tobtc?currency=USD&value=1"` | bc -l
}

alias diff="colordiff"
alias feh="feh --scale-down"
alias hex="xxd -p"
alias ls="ls -a --color=always"
alias pacman-log="cat /var/log/pacman.log"
alias pw="makepasswd --count 50 --chars "
alias reboot="systemctl reboot"
alias shutdown="systemctl poweroff"
alias suspend="systemctl suspend"
alias vi="vim"
