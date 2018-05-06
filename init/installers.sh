#!/usr/bin/env bash

# NVM, Node, and Yarn

# travis already has nvm
if [[ ! -v TRAVIS ]]
then
command -v nvm >/dev/null 2>&1 || {
    "\\uf898 Installing the Node Version Manger (NVM)"
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.9/install.sh | bash
}
fi

if [ ! "$(command -v nvm >/dev/null 2>&1)" ]
then
    echo "Error installing nvm \\uf119"
    [ -v EXIT_ON_ERROR ] && exit 1
else
    "\\uf898 Installing NodeJS and yarn"
    nvm install --lts || exit 1
    nvm use --lts || exit 1
    wget -qO- https://yarnpkg.com/install.sh | bash
    command -v yarn >/dev/null 2>&1 || {
        echo "Error installing yarn \\uf119"
        [ -v EXIT_ON_ERROR ] && exit 1
    }

    # Install common packages I tend to use a lot
    # TODO: set packages to environment variable
    if [ -v PREFER_NPM ]
    then
        command -v npm >/dev/null 2>&1 || {
            echo "npm is not installed \\uf7d3"
            exit 1
        }
        echo "You should really be using yarn \\uf004"
        npm install -g eslint typescript tslint rimraf
    else
        yarn global add eslint typescript tslint rimraf
    fi
fi

# Haskell Stack

if [[ -v INSTALL_STACK ]]
then
command -v stack >/dev/null 2>&1 || {
    echo "\\ue61f Installing the Haskell stack toolchain"
    wget -qO- https://get.haskellstack.org/ | sh
}

stack --version >/dev/null 2>&1 || {
    echo "Error installing stack \\uf119"
    [ -v EXIT_ON_ERROR ] && exit 1
}
fi

# Docker

if [[ ! -v TRAVIS ]]
then
command -v docker >/dev/null 2>&1 || {
    echo "\\uf308 Installing docker"
    curl -fsSL get.docker.com | bash
    sudo usermod -aG docker "$USER"
    echo "!!! Logout and log back in to use docker without using 'sudo' !!!"
}
fi

# Rust
if [[ ! -v TRAVIS ]]
then
command -v rustup >/dev/null 2>&1 || {
    echo "\\ue7a8 Installing rust(up)"
    curl https://sh.rustup.rs -sSf | sh
}

command -v cargo >/dev/null 2>&1 || {
    echo "cargo failed to install properly \\uf119"
    [ -v EXIT_ON_ERROR ] && exit 1
}
fi

