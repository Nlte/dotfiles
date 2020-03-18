#!/bin/bash

source $HOME/.dotfiles/utils.sh

if [ ! command -v tmux ]; then
	info "installing tmux"
	brew install tmux
fi

if [ ! -f $HOME/.config/tmux/plugins/tpm ]; then
	info "installing tmux plugin manager"
	git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
fi
