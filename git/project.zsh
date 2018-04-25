#!/usr/bin/env zsh

git_project()
{
    local _type=$0
    local _name=$1
    local _opt=$2

    case $_type in
        stack) stack new $_name --resolver="$_opt" ; cd $name ;;
        node) mkdir $_name ; cd $_name ; git init ; yarn init ;;
        rust) cargo new $_name ; cd $_name; ;;
        *) echo "unknown project type \uf119"; exit 1 ;;
    esac
}
