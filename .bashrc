# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=4000

export LANG=en_US.UTF-8

shopt -s checkwinsize

# Enable completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# ls () { /bin/ls -h --color=auto "$@"; }

source $HOME/.bash_prompt

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/timd/.sdkman"
[[ -s "/home/timd/.sdkman/bin/sdkman-init.sh" ]] && source "/home/timd/.sdkman/bin/sdkman-init.sh"

source /home/timd/.config/broot/launcher/bash/br
