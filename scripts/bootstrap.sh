#!/bin/sh

source $HOME/.dotfiles/utils.sh

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

set -e

echo ''


check_requirements() {
	info 'checking requirements'
	declare -a arr=("git" "curl" "tar")
	for cmd in "${arr[@]}"; do
		command -v $cmd > /dev/null
		if ! [ $? == 0 ]; then
			fail "${cmd} not found"
			exit 1
		fi
	done
}

setup_gitconfig() {
	info 'setup gitconfig'
	# if there is no user.email, we'll assume it's a new machine/setup and ask it
	if [ -z "$(git config --global --get user.email)" ]; then
		user ' - What is your github author name?'
		read -r user_name
		user ' - What is your github author email?'
		read -r user_email

		git config --global user.name "$user_name"
		git config --global user.email "$user_email"
	elif [ "$(git config --global --get dotfiles.managed)" != "true" ]; then
		# if user.email exists, let's check for dotfiles.managed config. If it is
		# not true, we'll backup the gitconfig file and set previous user.email and
		# user.name in the new one
		user_name="$(git config --global --get user.name)"
		user_email="$(git config --global --get user.email)"
		mv ~/.gitconfig ~/.gitconfig.backup
		success "moved ~/.gitconfig to ~/.gitconfig.backup"
		git config --global user.name "$user_name"
		git config --global user.email "$user_email"
	else
		# otherwise this gitconfig was already made by the dotfiles
		info "already managed by dotfiles"
	fi
	# include the gitconfig.local file
	git config --global include.path ~/.gitconfig.local
	# finally make git knows this is a managed config already, preventing later
	# overrides by this script
	git config --global dotfiles.managed true
	success 'gitconfig'
}

install_dotfiles() {
	info 'installing dotfiles'
	find -H "$DOTFILES_ROOT" -maxdepth 3 -name '*.symlink' -not -path '*.git*' |
		while read -r src; do
			dst="$HOME/.$(basename "${src%.*}")"
			link_file "$src" "$dst"
		done
}

check_requirements || exit 1
setup_gitconfig
install_dotfiles

info "installing dependencies"
if ./bin/dotfile_update; then
	success "dependencies installed"
else
	fail "error installing dependencies"
fi
