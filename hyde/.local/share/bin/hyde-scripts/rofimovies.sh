#!/bin/bash

confDir="$HOME/.config"
roConf="$confDir/rofi/movies.rasi"

BASE_DIR="/mnt/668E28458E280FDB/Movies"  # Main movies directory
DOW_DIR="/mnt/668E28458E280FDB/Downloads"  # Download movies directory

# # List all folders relative to BASE_DIR
# folder_list=$(find "$BASE_DIR" "$DOW_DIR"\
#                 ! -path "$BASE_DIR" \
#                 ! -path "$DOW_DIR" \
#                 ! -name "Other" \
#                 ! -name "Subs" \
#                 -type d | sed -e "s|$DOW_DIR/||" -e "s|$BASE_DIR/||")
#
# Add this above if you want to disclude video
# ! -path "$DOW_DIR/Videos*" \

folders_base=$(cd "$BASE_DIR" && fd -t d . --exclude "Other" --exclude "Subs" --strip-cwd-prefix)
folders_dow=$(cd "$DOW_DIR" && fd -t d . --exclude "Other" --exclude "Subs" --strip-cwd-prefix)

folder_list=$(printf "%s\n%s\n" "$folders_dow" "$folders_base")

# Show in rofi with fuzzy search
selected=$(echo "$folder_list" | rofi -dmenu -i -p "Select movie folder" -config "$roConf")

# Handle selection
if [[ -n "$selected" ]]; then
	if [[ -d "$BASE_DIR/$selected" ]] ; then
        nautilus "$BASE_DIR/$selected"
    elif [[ -d "$DOW_DIR/$selected" ]] ; then
        nautilus "$DOW_DIR/$selected"
    fi
fi
