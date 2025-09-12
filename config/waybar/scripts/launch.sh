#!/usr/bin/env bash

if pgrep -x "waybar" > /dev/null; then
    # Waybar is running, kill it
    killall -9 waybar
    notify-send -t 2000 "Waybar toggled OFF"
else
    # Waybar is not running, start it
    waybar &
    notify-send -t 2000 "Waybar toggled ON"
fi

