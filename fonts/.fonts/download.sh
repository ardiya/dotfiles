#!/usr/bin/env bash
set -e

curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FantasqueSansMono.tar.xz"
tar -xf FantasqueSansMono.tar.xz
rm FantasqueSansMono.tar.xz

curl -OL "https://github.com/adam7/delugia-code/releases/latest/download/delugia-mono-complete.zip"
unzip -j delugia-mono-complete.zip
rm delugia-mono-complete.zip

