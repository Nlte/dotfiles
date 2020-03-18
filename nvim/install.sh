#!/bin/sh

source $HOME/.dotfiles/utils.sh

command -v nvim > /dev/null
if ! [ $? == 0 ]; then
	info "installing neovim"
	brew install neovim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	mkdir -p ~/.config/nvim/
	ln -sf "$DOTFILES/nvim/init.vim.symlink" ~/.config/nvim/init.vim
	ln -sf "$DOTFILES/nvim/nord_additional_syntax.vim" ~/.config/nvim/
	nvim +'PlugInstall --sync' +qa
	nvim +'PlugUpdate' +qa
else
	success "neovim already installed"
fi
