#!/bin/sh

source $HOME/.dotfiles/utils.sh

install() {
	curl -L -s -o "$1/SourceCodePro-Light.ttf" \
		https://github.com/adobe-fonts/source-code-pro/raw/release/TTF/SourceCodePro-Light.ttf
}

if [ "$(uname -s)" = "Darwin" ]; then
	if command -v brew >/dev/null 2>&1; then
		brew tap homebrew/cask-fonts
		brew cask ls | grep -q font-source-code-pro
		if [ $? == 127 ]; then
			info "install Source code pro font"
			brew cask install font-source-code-pro
		else
			success "Source code pro font already installed"
		fi
	else
		install ~/Library/Fonts
	fi
else
	mkdir -p ~/.fonts
	install ~/.fonts
fi
