#!/bin/bash

source $HOME/.dotfiles/utils.sh

exit 1

command -v fish > /dev/null
if ! [ $? == 0 ]; then
	info "installing fish shell"
	brew install fish
else
	success "fish shell already installed"
fi

mkdir -p $HOME/.config/fish
link_file $(current_dir_path)/fishfile $HOME/.config/fish/fishfile
link_file $(current_dir_path)/config.fish ~/.config/fish/config.fish
