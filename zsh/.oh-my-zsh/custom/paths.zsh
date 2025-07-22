# Personal Paths
PATH=~/.console-ninja/.bin:$PATH
export PATH=$PATH:$HOME/.spicetify:$HOME/Documents/Scripts:$HOME/.local/bin:$HOME/.local/share/bin/hyde-scripts
export CODE="$HOME/Documents/Code"
export CPD="$HOME/Documents/Code/CPD"
export DOT="$HOME/.dotfiles/"
export WEB="$HOME/Documents/Code/Web"
export SCRIPTS="$HOME/Documents/Scripts"
export ZEIT_DB="$HOME/.config/zeit.db"
export NI_CONFIG_FILE="$HOME/.nirc"

# pnpm
export PNPM_HOME="/home/patrix/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
