# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim

ZSH_THEME="xiong-chiamiov-plus"

plugins=( 
    git
    dnf
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# check the dnf plugins commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dnf


# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
# source <(fzf --zsh)

# HISTFILE=~/.zsh_history
# HISTSIZE=10000
# SAVEHIST=10000
# setopt appendhistory


# ~/.zshrc

eval "$(starship init zsh)"

PATH=~/.console-ninja/.bin:$PATH
alias ntop="sudo nethogs"
alias ttp="tt -n 100"
alias c="wl-copy"
alias hot="sudo create_ap wlp2s0 wlp2s0 EDITH jarvis726"
alias pn="pnpm"
alias subs="subliminal download -l en *.mp4"
export PATH=$PATH:$HOME/.spicetify:$HOME/Documents/Scripts:$HOME/.local/bin
export CODE="$HOME/Documents/Code"
export CPD="$HOME/Documents/Code/CPD"
export DOT="$HOME/.dotfiles/"
export WEB="$HOME/Documents/Code/Web"
export SCRIPTS="$HOME/Documents/Scripts"
export NI_CONFIG_FILE="$HOME/.nirc"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/patrix/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

cursor() {
    args=("$@")
    (nohup ~/Applications/Cursor.AppImage "${args[@]}" --no-sandbox </dev/null >/dev/null 2>&1 &)
}

function yz() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
