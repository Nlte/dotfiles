#!/bin/bash

source $HOME/.dotfiles/utils.sh

function install_developer_tools() {
        xcode-select -p 1>/dev/null
        if [ $? != 0 ]
        then
                info "Installing developer tools..."
                xcode-select --install
        else
                success "developer tools already installed"
        fi
}

function install_missing_packages() {
	info "installing missing package for emacs"
	comm -23 <(sort requirements.txt) <(brew ls --full-name) | xargs brew install
}

function install_emacs_plus() {
	emacs_found=$(brew ls --full-name | rev | cut -d'/' -f 1 | rev | grep -c "emacs-plus")
	if [ $emacs_found != 1 ]; then
		info "installing emacs-plus"
		brew tap d12frosted/emacs-plus
		brew install emacs-plus
		ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app
	else
		success "emacs-plus already installed"
	fi
}


function install_doom() {
	if [ ! -d "$HOME/.emacs.d/" ]; then
		info "installing doom emacs"
		git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
		~/.emacs.d/bin/doom install
	else
		success "doom emacs already installed"
	fi
}

function link_doom_d() {
	#mkdir -p "$HOME/.doom.d"
	link_dir "$HOME/.dotfiles/emacs/doom.d" "$HOME/.doom.d"
}

install_developer_tools
install_missing_packages
install_emacs_plus
install_doom
link_doom_d

