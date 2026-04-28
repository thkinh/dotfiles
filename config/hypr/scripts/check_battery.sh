#!/bin/sh

cap=$(cat /sys/class/power_supply/BAT1/capacity)
status=$(cat /sys/class/power_supply/BAT1/status)

if [ "$status" = "Charging" ]; then
    icon="󰂄"
    printf "%s %s%%\n" "$icon" "$cap"
    exit 0 
fi

if [ "$cap" -ge 90 ];    then icon="󰁹"
elif [ "$cap" -ge 70 ];  then icon="󰂂"
elif [ "$cap" -ge 50 ];  then icon="󰁿"
elif [ "$cap" -ge 30 ];  then icon="󰁼"
elif [ "$cap" -ge 15 ];  then icon="󰁻"
else icon="󰂎"
fi

printf "%s %s%%\n" "$icon" "$cap"
