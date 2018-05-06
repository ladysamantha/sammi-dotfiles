#!/usr/bin/env bash

ls -lHa "$HOME/.config/nvim"

[[ -d "$HOME/.config/nvim" ]] || {
    # shellcheck disable=SC2088
    echo '~/.config/nvim is not a directory' 1>&2
    exit 1
}

[[ -h "$HOME/.config/nvim/init.vim" ]] || {
    # shellcheck disable=SC2088
    echo '~/.config/nvim/init.vim is not set (or not a file)' 1>&2
    exit 1
}

ls -lHa "$HOME"

[[ -h "$HOME/.vimrc" ]] || { 
    # shellcheck disable=SC2088
    echo '~/.vimrc is not set (or not a file)' 1>&2
    exit 1
}

[[ -h "$HOME/.zshrc" ]] || {
    # shellcheck disable=SC2088
    echo '~/.zshrc is not set (or not a file)' 1>&2
    exit 1
}
