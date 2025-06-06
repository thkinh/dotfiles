#!/bin/bash

# Check for toggle
if [ "$1" == "toggle" ]; then
    if pgrep -x "ibus-daemon" > /dev/null; then
        echo '{"text": "ENG", "tooltip": "English Keyboard Enabled"}'
        pkill ibus-daemon
    else
        echo '{"text": "VIE", "tooltip": "Vietnamese Keyboard Enabled"}'
        ibus-daemon -dr
    fi

    # Force Waybar to refresh this module (you must set up signal for it)
    pkill -RTMIN+9 waybar
    exit 0
fi

# Output state based on ibus-daemon status
if pgrep -x "ibus-daemon" > /dev/null; then
    echo '{"text": "VIE", "tooltip": "Vietnamese Keyboard Enabled"}'
    exit 0
else
    echo '{"text": "ENG", "tooltip": "English Keyboard Enabled"}'
fi

