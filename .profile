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
$HOME/bin:$HOME/bin-hs/.cabal-sandbox/bin:\
/usr/local/ghc-7.8.2/bin:\
/usr/local/sbin:/usr/local/bin:\
/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

export LANGUAGE="en_AU:en"
export LC_MESSAGES="en_AU.UTF-8"
export LC_CTYPE="en_AU.UTF-8"
export LC_COLLATE="en_AU.UTF-8"

export CLOUDSDK_PYTHON=/usr/local/bin/python2.7

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/timd/google-cloud-sdk/path.bash.inc' ]; then source '/Users/timd/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/timd/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/timd/google-cloud-sdk/completion.bash.inc'; fi
