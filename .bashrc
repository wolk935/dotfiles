# interactive bash only
[ -z "$PS1" ] && return

shopt -s histappend
HISTCONTROL=ignoredups:ignorespace
HISTFILESIZE=102400
HISTSIZE=10000

# wrap after resize
shopt -s checkwinsize

# use colour prompt if available
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	PS1='$\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='$\u@\h:\w\$ '
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

	alias vi="vim"
	alias grep='grep --color=always'
	alias less='less -R'
	alias ls='ls --color=always'
fi
