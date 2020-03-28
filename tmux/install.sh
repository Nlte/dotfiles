#!/bin/bash

source $HOME/.dotfiles/utils.sh

command -v tmux >/dev/null
if ! [ $? == 0 ]; then
	info "installing tmux"
	brew install tmux
fi

if [ ! -d $HOME/.config/tmux/plugins/tpm ]; then
	info "installing tmux plugin manager"
	git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
fi
