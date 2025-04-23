#!/bin/bash

# Read current wallpaper path
WALL=$(cat ~/.cache/self_created/current_wall)

# Generate updated config
sed "s|{{WALLPAPER}}|$WALL|g" ~/.config/hypr/hyprlock.template.conf > ~/.config/hypr/hyprlock.conf

# Run hyprlock
hyprlock

