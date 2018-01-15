#!/bin/bash
echo -ne "\033]0;nix-shell-plp\007"
exec nix-shell --command "source $HOME/.bash_prompt; cd $HOME/helix/projects/polez/polez; return" $HOME/nix/plp.nix
