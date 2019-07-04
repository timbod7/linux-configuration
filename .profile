# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH
export PATH=\
$HOME/bin:\
/usr/local/sbin:/usr/local/bin:\
/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# And overlay nix
source  $HOME/.nix-profile/etc/profile.d/nix.sh
export NIX_PATH=$HOME/.nix-defexpr/channels/

# relies on `nix-env -i git` having been run
source $HOME/.nix-profile/etc/bash_completion.d/git-prompt.sh
source $HOME/.bash_prompt

# Use kakoune as the default editor
export EDITOR=kak

export LANGUAGE="en_AU:en"
export LC_MESSAGES="en_AU.UTF-8"
export LC_CTYPE="en_AU.UTF-8"
export LC_COLLATE="en_AU.UTF-8"

export PATH="$HOME/.cargo/bin:$PATH"
