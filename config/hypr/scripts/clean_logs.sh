#!/bin/sh

LOG_DIR="/home/$USER/.cache/self_created/mylogs"

for file in "$LOG_DIR"/*; do
    [ -f "$file" ] && : > "$file"
done
