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

echo "Running init scripts"

for file in $(find $(pwd)/init -type -iname '*.*sh')
do
    echo "running script: ${file}"
    [ -x "${file}"] && exec "${file}"
done

echo "Symlinking files to \$ZSH_CUSTOM"
for file in $(find $(pwd)/scripts -type f -iname '*.zsh' 2>/dev/null)
do
    ln -s "${file}" "$ZSH_CUSTOM/$(basename $file)"
done

