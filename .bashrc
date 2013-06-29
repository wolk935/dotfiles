# interactive bash only
[ -z "$PS1" ] && return

# aliases
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

# history
shopt -s histappend
HISTCONTROL=ignoredups:ignorespace:erasedups
HISTFILESIZE=10240000
HISTSIZE=1000000

# wrap after resize
shopt -s checkwinsize

# use colour prompt if available
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	PS1="$\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
else
	PS1="$\u@\h:\w\$ "
fi
