# fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# env variable
set -gx EDITOR vim
set -gx FZF_DEFAULT_OPTS "--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C\
			--color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B"


# path
set PATH $HOME/Library/Python/3.7/bin $PATH
set PATH $HOME/miniconda3/bin $PATH
set PATH $HOME/.dotfiles/bin $PATH


# alias
alias vim=nvim
alias prm="bass source ~/.config/prm/prm.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/nathanaelleaute/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

