#!/bin/sh

NVIM=$(command -v nvim)
HAS_NVIM=$?

TMUX=$(command -v tmux)
HAS_TMUX=$?

if [ $HAS_TMUX -eq 0 ]; then
    source ./init/tmux.sh
fi

if [ $HAS_NVIM -eq 0 ]; then
    source ./init/nvim.sh
fi

