#!/bin/bash
sleep 2
FIRST_IMG=$(cat ~/.cache/self_created/current_wall)
if [ -f "$FIRST_IMG" ]; then
    hyprctl hyprpaper wallpaper ",$FIRST_IMG"
    echo "Set $FIRST_IMG as temporary wallpaper"
fi
