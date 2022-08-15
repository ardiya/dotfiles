#!/usr/bin/env bash
set -e
set -x

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

PKGS=(
    aria2
    clangd
    zsh
    tmux
    fonts
    kitty
    vim
    nvim
)

pushd ${SCRIPT_DIR} &> /dev/null
stow ${PKGS[@]}
popd &> /dev/null
