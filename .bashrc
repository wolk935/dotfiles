# interactive bash only
[ -z "$PS1" ] && return

# aliases
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

export EDITOR=vim
export VISUAL=vim

# history
shopt -s histappend

# UTF-8 aware
export LC_ALL=en_AU.UTF-8

export HISTCONTROL=ignoredups:erasedups
export HISTFILE=~/.bash_history
export HISTSIZE=1024000
export HISTFILESIZE=1024000
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export LESSHISTFILE=/dev/null

export GOPATH=~/workspace/go
export NODE_PATH=~/workspace/npm
export PATH=$PATH:$GOPATH/bin:$NODE_PATH/bin

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
