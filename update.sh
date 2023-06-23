#!/usr/bin/env sh
DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
CFG=$HOME/.config

rm -rf $DIR/nvim
cp -r $CFG/nvim $DIR

rm -rf $DIR/diary
cp -r $CFG/diary $DIR
