#!/bin/bash

if [ "$1" == "reset" ]; then
  if [[ -d ./config ]]; then
    rm -rf ./config
    echo 'Removed /config'
    exit 0
  fi
fi

MAIN_DIR="$HOME/.config"

CONFIG_DIRS=(
  "cava"
  "dunst"
  "fastfetch"
  "kitty"
  "hypr"
  "waybar"
  "wal"
  "wofi"
  "wlogout"
  "nwg-look"
  "ibus-bamboo"
)

#mimeapp.list
cp $HOME/.config/mimeapps.list ./config/mimeapps.list

mkdir -p ./config
for sub in "${CONFIG_DIRS[@]}"; do
  src="$MAIN_DIR/$sub"
  if [[ -d "$src" ]]; then
    cp -r "$src" "./config/"
    echo "Backed up: $src"
  else
    echo "Warning: Source directory not found: $src" >&2
  fi
done
