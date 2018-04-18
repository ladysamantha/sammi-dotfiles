#!/bin/bash

NVIM=$(command -v nvim)
TMUX=$(command -v tmux)

if [[ -x $TMUX ]]; then
    source ./init/tmux.sh
fi

if [[ -x $NVIM ]]; then
    source ./init/nvim.sh
fi

# Vim config
command -v vim >/dev/null 2>&1 || {
    echo "Some vim is not installed"
    exit 1
}

source ./init/vim.sh

