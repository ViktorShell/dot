#!/bin/bash

ROOT_DIR=$(pwd)/config/ # directory di git
FISH=$ROOT_DIR"fish"
KITTY=$ROOT_DIR"kitty"
TMUX=$ROOT_DIR"tmux"
CONFIG_DIR=$HOME/.config/

# Enter the config directory
cp -r $FISH $CONFIG_DIR
cp -r $KITTY $CONFIG_DIR
cp -r $TMUX $CONFIG_DIR

# Setup NvChad
git clone https://github.com/NvChad/NvChad $CONFIG_DIR/nvim --depth 1 && nvim
cp -r $ROOT_DIR/nvim/custome $CONFIG_DIR/nvim/lua

echo "Installation Complited!!"
