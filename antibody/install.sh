#!/bin/sh

source $HOME/.dotfiles/utils.sh

command -v antibody > /dev/null
if [ $? != 0 ]; then
	info "installing antibody"
	if command -v brew > /dev/null 2>&1; then
		brew tap | grep -q 'getantibody/tap' || brew tap getantibody/tap
		brew install antibody
	else
		curl -sL https://git.io/antibody | sudo sh -s -- -b /usr/local/bin
	fi
else
	success "antibody already installed"
fi
antibody bundle <"$DOTFILES/antibody/bundles.txt" >~/.zsh_plugins.sh
info "updating antibody"
antibody update
