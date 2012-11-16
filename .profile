# ~/.profile: executed by the command interpreter for login shells (preceeds .bash_profile)
# if running bash, .bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
