#!/usr/bin/env bash

# Directory containing your configs
CONFIGS_DIR="$HOME/.config"
EDITOR="nvim"
RofiConf="${XDG_CONFIG_HOME:-$HOME/.config}/rofi/clipboard.rasi" # Can be changed later

# List of allowed config folders (edit this list)
ALLOWED_CONFIGS=(
  "hypr"
  "waybar"
  "rofi"
  "kitty"
  "nvim"
  "rmpc"
  "hyde"
  "mpd"
  "mpv"
  "zsh"
)

# Use rofi to pick a config
CHOICE=$(printf "%s\n" "${ALLOWED_CONFIGS[@]}" | rofi -dmenu -p "Edit Config:" -config $RofiConf)

# If nothing selected, exit
[ -z "$CHOICE" ] && exit 1

# Full path to selected config
CONFIG_PATH="$CONFIGS_DIR/$CHOICE"

# Check if the path exists
if [ -d "$CONFIG_PATH" ]; then
  kitty --title "Editing $CHOICE config" --directory "$CONFIG_PATH" nvim "$CONFIG_PATH"
else
  notify-send "Config not found: $CONFIG_PATH"
  exit 1
fi
