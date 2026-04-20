#!/bin/bash

# Get the current working directory
current_path=$(pwd)

# Extract folder name (current directory)
foldername=$(basename "$current_path")

# Extract parent folder name
parent_foldername=$(basename "$(dirname "$current_path")")

session_name="${parent_foldername}/${foldername}"

config_file="$HOME/.config/sesh/sesh.toml"

# Create config directory if it doesn't exist
mkdir -p "$HOME/.config/sesh"

# Append the new session entry to the config file
cat >> "$config_file" << EOF

[[session]]
name = "${session_name}"
path = "${current_path}"
startup_command = "nvim"
windows = [ "dev", "opencode" ]
EOF

nvim "$config_file"
