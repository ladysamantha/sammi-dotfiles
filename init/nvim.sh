#!/bin/sh

NVIM_CONF=$HOME/.config/nvim

mkdir -p $NVIM_CONF

if ! [ -f $NVIM_CONF/init.conf ] ; then 
    ln -s $NVIM_CONF/init.vim ../nvim/init.vim
fi
