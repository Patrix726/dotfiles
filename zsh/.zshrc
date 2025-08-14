# zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export EDITOR=nvim
# ZSH_THEME="xiong-chiamiov-plus"

plugins=( 
    git
    dnf
    mise
    zsh-autosuggestions
    zsh-syntax-highlighting
    zeit
    you-should-use
    zsh-bat
    zsh-defer
    evalcache
    docker
)

source $ZSH/oh-my-zsh.sh

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

# HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# setopt appendhistory

_evalcache starship init zsh
_evalcache zoxide init zsh --cmd cd
zsh-defer mise activate zsh

precmd() { precmd() { echo "" } }
# Paths can be found at $HOME/.oh-my-zsh/custom/paths.zsh
# Aliases can be found at $HOME/.oh-my-zsh/custom/aliases.zsh
# Functions can be found at $HOME/.oh-my-zsh/custom/func.zsh

PATH=~/.console-ninja/.bin:$PATH
