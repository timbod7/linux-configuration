#!/bin/bash
echo -ne "\033]0;nix-shell-plp\007"
exec nix-shell --command "source $HOME/.bash_prompt; return" $HOME/nix/plp.nix
