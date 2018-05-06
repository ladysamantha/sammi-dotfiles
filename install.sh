#!/bin/bash

./deps.sh

# Vim config
command -v vim >/dev/null 2>&1 || {
    echo "Some vim is not installed"
    exit 1
}

echo "configuring zsh"
./zsh/init.sh

# tmux config
[[ -f "./tmux/init.sh" && -x "./tmux/init.sh" ]] && {
    echo "configuring tmux"
    ./init/tmux.sh
} 

# neovim config
echo "configuring neovim"
./nvim/init.sh

# now configure vim
echo "configuring vim"
./vim/init.sh

if [[ "$SCRIPTS_ONLY" == "0" ]]; then
    echo "Running init scripts"

    echo "Installing Bazel"
    ./init/install_bazel.sh || exit 1

    echo "Other installers"
    ./init/installers.sh || exit 1

    echo "Symlinking files to \$ZSH_CUSTOM"

    find "$(pwd)/scripts" -maxdepth 1 -type f -iname '*.zsh' 2>/dev/null -exec ln -s {} "$ZSH_CUSTOM/$(basename {})" \;
fi
