#!/usr/bin/env bash
# Scripts to install package I usually use in ubuntu
set -e
set -x

sudo () {
    # https://unix.stackexchange.com/a/428659
    local command=$@
    read -rp "Shall command $command be executed? (y/N): "
    local YORN_RESP="$(grep -i "[YN]" <<<"${REPLY:0:1}" || echo 'N')"
    if [[ "$YORN_RESP" == [Yy] ]]; then
        command sudo "$@"
    else
        return 1
    fi
}

# Update all
sudo pacman -Syu

PKGS=(
    bat
    exa
    fd
    foliate
    ibus-libpinyin # I'm polyglot :)
    ibus-anthy     # I'm polyglot :)
    inetutils
    materia-gtk-theme
    neovim
    net-tools
    procs
    ripgrep
    stow
    tldr
    vim
    visual-studio-code-bin
    vlc
)

yay -S ${PKGS[@]}
