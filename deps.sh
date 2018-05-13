#!/usr/bin/env bash

DEPS=( git curl jq )

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

DEPS_RUN=1
export DEPS_RUN
