#!/usr/bin/env bash

DEPS=( brew curl jq )

assert_exists()
{
    local prog=$1
    [ -z "${prog}" ] && return 2
    command -v "${prog}" >/dev/null 2>&1 || {
        echo "${prog} is either not installed, or not in your path"
        exit 1
    }
}

for dep in "${DEPS[@]}"
do
    assert_exists "${dep}"
done

DEPS_RUN=$(/bin/true)
export DEPS_RUN
