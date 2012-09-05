# ~/.profile: for login shells (preceeds .bash_profile)
# run bashrc if bash
if [ -n "$BASH_VERSION" ]; then
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi
