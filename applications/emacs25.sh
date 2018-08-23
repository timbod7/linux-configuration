#!/bin/bash
exec nix-shell --command /usr/bin/emacs $HOME/nix/default.nix
