
info() {
        # shellcheck disable=SC2059
        printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user() {
        # shellcheck disable=SC2059
        printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success() {
        # shellcheck disable=SC2059
        printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail() {
        # shellcheck disable=SC2059
        printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
        echo ''
}

link_file() {
	if [ -e "$2" ]; then
		if [ "$(readlink "$2")" = "$1" ]; then
			success "skipped $1"
			return 0
		else
			mv "$2" "$2.backup"
			success "moved $2 to $2.backup"
		fi
	fi
	ln -sf "$1" "$2"
	success "linked $1 to $2"
}

link_dir() {
	if [ -e "$2" ]; then
		if [ "$(readlink "$2")" = "$1" ]; then
			success "skipped $1"
			return 0
		else
			mv "$2" "$2.backup"
			success "moved $2 to $2.backup"
		fi
	fi
	ln -s "$1" "$2"
	success "linked $1 to $2"
}

current_dir_path() {
	echo "$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
}
