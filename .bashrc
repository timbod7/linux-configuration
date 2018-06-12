# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=4000

export LANG=en_US.UTF-8

# ls () { /bin/ls -h --color=auto "$@"; }

# relies on `nix-env -i git` having been run
source $HOME/.nix-profile/etc/bash_completion.d/git-prompt.sh
source $HOME/.bash_prompt
