#!/bin/bash

./deps.sh

# Vim config
command -v vim >/dev/null 2>&1 || {
    echo "Some vim is not installed"
    exit 1
}

# tmux config
./init/tmux.sh

# neovim config
./init/nvim.sh

# now configure vim
./init/vim.sh

echo "Running init scripts"

find "$(pwd)/init" -type f -iname '*.*sh' -exec {} \;

echo "Symlinking files to \$ZSH_CUSTOM"

find "$(pwd)/scripts" -type f -iname '*.zsh' 2>/dev/null -exec ln -s {} "$ZSH_CUSTOM/$(basename {})" \;
