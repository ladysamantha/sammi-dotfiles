#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="$( (cd "$DIR/.." && pwd) || exit 1)"

if [[ -f "$HOME/.zshrc" ]]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi

ln -s "$ROOT_DIR/zsh/zshrc.zsh" "$HOME/.zshrc"

