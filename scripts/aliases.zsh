#!/usr/bin/zsh

command -v docker >/dev/null 2>&1 && {
    alias dps="docker ps"
    alias dpsa="dps -a"
    alias dimg="docker images"
}

command -v docker-compose >/dev/null 2>&1 && {
    alias dc=docker-compose
}
