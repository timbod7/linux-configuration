#!/bin/bash
echo -ne "\033]0;htop\007"
exec nix-shell --command "htop" $HOME/nix/default.nix
