#!/bin/bash
sleep 1
FIRST_IMG=$(cat ~/.cache/self_created/current_wall)
if [ -f "$FIRST_IMG" ]; then
    hyprctl hyprpaper wallpaper ",$FIRST_IMG"
    echo "Set $FIRST_IMG as temporary wallpaper"
fi
