#!/bin/bash

source $HOME/.dotfiles/utils.sh

command -v sqlite3 >/dev/null
if ! [ $? == 0 ]; then
    info "installing sqlite3"
    brew install sqlite3
fi
