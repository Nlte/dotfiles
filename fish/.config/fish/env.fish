# ENV
set -gx LANG en_US.utf-8

# gcc-arm toolchain
set -g fish_user_paths $HOME/opt/gcc-arm-none-eabi-7-2018-q2-update/bin $fish_user_paths

# binaries
set -g fish_user_paths $HOME/utils/binaries $fish_user_paths

# brew prefix
set -g BREW_PREFIX /usr/local 
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
