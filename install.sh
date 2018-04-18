#!/bin/bash

NVIM=$(command -v nvim)
TMUX=$(command -v tmux)
VIM=$(command -v vim)

if [[ -x $TMUX ]]; then
    source ./init/tmux.sh
fi

if [[ -x $NVIM ]]; then
    source ./init/nvim.sh
fi

if [[ -x $VIM ]]; then
    source ./init/vim.sh
fi

