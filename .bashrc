# interactive bash only
[ -z "$PS1" ] && return

# aliases
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

export EDITOR=vim
export VISUAL=vim

# color options
export GREP_OPTIONS='--color=always -I'
export LESS='--no-init --quit-if-one-screen --RAW-CONTROL-CHARS'

# history
shopt -s histappend

export HISTCONTROL=ignoredups:erasedups
export HISTFILE=/dev/null
export HISTSIZE=0
export HISTFILESIZE=0
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export LESSHISTFILE=/dev/null

# wrap after resize
shopt -s checkwinsize

# fix buggy bash/irssi
echo -n $(tput smkx) > /dev/tty

# use colour prompt if available
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
else
	PS1="\u@\h:\w\$ "
fi
