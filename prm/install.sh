#!/bin/bash

source $HOME/.dotfiles/utils.sh

mkdir -p ~/.config/prm
link_file $(current_dir_path)/prm/prm.sh ~/.config/prm/prm.sh
