# interactive bash only
[ -z "$PS1" ] && return

# history
shopt -s histappend
HISTCONTROL=ignoredups:ignorespace:erasedups
HISTFILESIZE=10240000
HISTSIZE=1000000
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# wrap after resize
shopt -s checkwinsize

# aliases
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# use colour prompt if available
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	PS1="$\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
else
	PS1="$\u@\h:\w\$ "
fi
