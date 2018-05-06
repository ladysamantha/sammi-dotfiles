#!/bin/bash

./deps.sh

# Vim config
command -v vim >/dev/null 2>&1 || {
    echo "Some vim is not installed"
    exit 1
}

echo "configuring zsh"
./init/zsh.sh

# tmux config
[[ -f "./init/tmux" && -x "./init/tmux.sh" ]] && {
    echo "configuring tmux"
    ./init/tmux.sh
} 

# neovim config
echo "configuring neovim"
./init/nvim.sh

# now configure vim
echo "configuring vim"
./init/vim.sh

if [[ -z ${SCRIPTS_ONLY+undef} ]]; then
    echo "Running init scripts"

    find "$(pwd)/init" -type f -iname '*.*sh' -exec {} \;

    echo "Symlinking files to \$ZSH_CUSTOM"

    find "$(pwd)/scripts" -type f -iname '*.zsh' 2>/dev/null -exec ln -s {} "$ZSH_CUSTOM/$(basename {})" \;
fi
