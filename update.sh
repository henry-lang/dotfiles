#!/usr/bin/env sh
DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

rm -rf $DIR/nvim
cp -r ~/.config/nvim $DIR