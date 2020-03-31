#!/bin/sh

source $HOME/.dotfiles/utils.sh

command -v nvim > /dev/null
if ! [ $? == 0 ]; then
	info "installing neovim"
	brew install neovim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	nvim +'PlugInstall --sync' +qa
	nvim +'PlugUpdate' +qa
    pip3 install --user pynvim
    pip3 install --user neovim
else
	success "neovim already installed"
fi

mkdir -p ~/.config/nvim/
link_file "$HOME/.dotfiles/nvim/init.vim" ~/.config/nvim/init.vim
link_file "$HOME/.dotfiles/nvim/nord_additional_syntax.vim" ~/.config/nvim/nord_additional_syntax.vim
mkdir -p ~/.config/nvim/UltiSnips
link_dir "$HOME/.dotfiles/nvim/UltiSnips" ~/.config/nvim/UltiSnips/
