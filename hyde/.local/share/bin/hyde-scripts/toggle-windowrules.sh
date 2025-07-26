#!/bin/bash

CONFIG="$HOME/.config/hypr/windowrules.conf"
STATE_FILE="$HOME/.cache/hypr_windowrules_enabled"

# If state file doesn't exist, assume enabled
if [ ! -f "$STATE_FILE" ]; then
    echo "1" > "$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

if [[ "$STATE" == "1" ]]; then
    # Disable rules: comment out lines marked with [autoworkspace]
    sed -i 's/^\(windowrulev2.*\)/# \1/' "$CONFIG"
    echo "0" > "$STATE_FILE"
    notify-send "🛑 Hyprland window rules disabled"
else
    # Enable rules: uncomment lines with [autoworkspace]
    sed -i 's/^# \(windowrulev2.*\)/\1/' "$CONFIG"
    echo "1" > "$STATE_FILE"
    notify-send "✅ Hyprland window rules enabled"
fi

# Reload Hyprland config
hyprctl reload
