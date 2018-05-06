#!/bin/bash

./deps.sh

command -v nvim >/dev/null 2>&1 && {
    ./init/tmux.sh
}

command -v tmux >/dev/null 2>&1 && {
    ./init/nvim.sh
}

# Vim config
command -v vim >/dev/null 2>&1 || {
    echo "Some vim is not installed"
    exit 1
}

./init/vim.sh

echo "Running init scripts"

find "$(pwd)/init" -type f -iname '*.*sh' -exec {} \;

echo "Symlinking files to \$ZSH_CUSTOM"

find "$(pwd)/scripts" -type f -iname '*.zsh' 2>/dev/null -exec ln -s {} "$ZSH_CUSTOM/$(basename {})" \;
