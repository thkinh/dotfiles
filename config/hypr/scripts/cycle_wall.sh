#!/bin/bash

WALLPAPER_DIR="$HOME/BedRoom/_Collections/Wallpapers"
CACHE_FILE="$HOME/.cache/self_created/hyprpaper_wall_list"
INDEX_FILE="$HOME/.cache/self_created/hyprpaper_wall_index"

# Load wallpaper list from cache
if [ ! -f "$CACHE_FILE" ]; then
    echo "Error: Cache file not found. Please run reload_hyprpaper.sh first."
    notify-send "Error: Cache file not found. Please run reload_hyprpaper.sh first."
    exit 1
fi

# Load wallpapers into an array
mapfile -t WALLS < "$CACHE_FILE"

# Load or initialize current index
CURRENT_INDEX=$(cat "$INDEX_FILE" 2>/dev/null || echo 0)

# Calculate the next index
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#WALLS[@]} ))

# Set wallpaper using hyprctl
# Check if file exists
if [ ! -f "${WALLS[$NEXT_INDEX]}" ]; then
    echo " Error: Wallpaper file not found: ${WALLS[$NEXT_INDEX]}"
    notify-send " Error: Wallpaper file not found: ${WALLS[$NEXT_INDEX]}"
    exit 1
fi
# Apply wallpaper
wal --cols16 -i "${WALLS[$NEXT_INDEX]}"
hyprctl hyprpaper wallpaper ",${WALLS[$NEXT_INDEX]}"  
# Apply wal
#if ! wal --cols16 -i "${WALLS[$NEXT_INDEX]}"; then
#    echo "Error: wal failed to apply colors."
#    exit 1
#fi

# Save the current wallpaper path
echo "${WALLS[$NEXT_INDEX]}" > $HOME/.cache/self_created/current_wall
echo "$NEXT_INDEX" > "$INDEX_FILE"
echo "Wallpaper set to: ${WALLS[$NEXT_INDEX]}"

