#!/usr/bin/env bash

ROOT_DIR="$( cd .. && pwd )"
NVIM_CONF="$HOME/.config/nvim"

mkdir -p $NVIM_CONF

if [[ ! -f $NVIM_CONF/init.vim ]] ; then 
    ln -s $ROOT_DIR/nvim/init.vim $NVIM_CONF/init.vim
fi
