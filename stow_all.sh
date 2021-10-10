#!/usr/bin/env bash
set -e
set -x

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

PKGS=(
    zsh
    tmux
    fonts
)

pushd ${SCRIPT_DIR} &> /dev/null
stow ${PKGS[@]}
popd &> /dev/null
