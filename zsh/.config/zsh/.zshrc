# zmodload zsh/zprof
source $ZDOTDIR/.antidote/antidote.zsh

HISTSIZE=10000
SAVEHIST=10000

antidote load

setopt correct

source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--style full --height 50% --layout reverse'

eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"

precmd() { precmd() { echo "" } }

bindkey '^R' fzf-history-widget

# Custom zsh scripts
source $ZDOTDIR/paths.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/func.zsh
