#!/usr/bin/env bash

GIT=$(command -v git)

if [[ ! -x $GIT ]]; then
    echo "git is not installed or in your PATH"
    exit 1
fi

git config --global alias.cp 'cherry-pick'
git config --global alias.st 'status -sb'
git config --global alias.cl 'clone'
git config --global alias.ci 'commit'
git config --global alias.co 'checkout'
git config --global alias.br 'branch'
git config --global alias.dc 'diff --cached'
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %Cblue<%an>%Creset' --abbrev-commit --date=relative --all"
git config --global alias.last 'log -1 --stat'
git config --global alias.unstage 'reset HEAD --'
