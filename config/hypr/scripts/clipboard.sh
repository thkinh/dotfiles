#!/bin/sh

cliphist list | wofi --dmenu --pre-display-cmd "echo '%s' | cut -f 2" -c /home/thkinh/.config/wofi/clipboardConf -s /home/thkinh/.config/wofi/clipboardStyle.css | cliphist decode | wl-copy

