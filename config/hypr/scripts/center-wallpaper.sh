#!/bin/bash

show_help() {
  echo "Usage: $0 image_file"
  echo ""
  echo "Creates a 1920x1080 wallpaper with the input image centered"
  echo "on a black background and sets it using 'swww'."
  echo ""
  echo "Options:"
  echo "  -h, --help      Show this help message and exit"
}

# Check for -h or --help
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  show_help
  exit 0
fi

# Validate input
if [[ -z "$1" || ! -f "$1" ]]; then
  echo "Error: Image file not provided or doesn't exist."
  show_help
  exit 1
fi

# Main logic
input="$1"
output="/tmp/wallpaper_centered.jpg"

convert -size 1920x1080 xc:black "$input" -gravity center -composite "$output"
swww img "$output"

