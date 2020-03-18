#!/bin/sh

source $HOME/.dotfiles/utils.sh

mkdir -p ~/.config/lldb/
success ln -sf "$DOTFILES/lldb/lldbinit.py" ~/.config/lldb/lldbinit.py
