#!/usr/bin/env sh
DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
CFG=$HOME/.config

cp -R $DIR/nvim $CFG/nvim
cp -R $DIR/diary $CFG/diary
