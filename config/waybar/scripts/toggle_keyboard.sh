#!/usr/bin/env bash

export STATUS_FILE="$XDG_RUNTIME_DIR/keyboard.status"

check_keyboard() {
    keyboard_status="$(cat "$STATUS_FILE")"
    echo "{\"text\": \"$keyboard_status\", \"tooltip\": \"Laptop keyboard status\"}"
}
        
if [ "$1" = "check" ]; then
    check_keyboard
    exit 0
fi


enable_keyboard() {
    printf "true" >"$STATUS_FILE"
    notify-send -u normal "Enabling Keyboard"
    hyprctl keyword '$LAPTOP_KB_ENABLED' "true" -r
}

disable_keyboard() {
    printf "false" >"$STATUS_FILE"
    notify-send -u normal "Disabling Keyboard"
    hyprctl keyword '$LAPTOP_KB_ENABLED' "false" -r
}

if ! [ -f "$STATUS_FILE" ]; then
  enable_keyboard
else
  if [ $(cat "$STATUS_FILE") = "true" ]; then
    disable_keyboard
    pkill -RTMIN+10 waybar
  elif [ $(cat "$STATUS_FILE") = "false" ]; then
    enable_keyboard
    pkill -RTMIN+10 waybar
  fi
fi
