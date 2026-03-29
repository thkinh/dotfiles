#!/bin/bash

# Define the input file
INPUT_FILE="fonts"

# Check if the file exists
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Error: File '$INPUT_FILE' not found."
    exit 1
fi

# Print Header
printf "%-40s | %s\n" "Font Name" "Available Styles"
echo "-----------------------------------------------------------------"

# Process the file:
# 1. Extract the font name and style using awk
# 2. Sort and group styles by font name
awk -F: '
{
    # Extract font name (usually the second field)
    split($2, name_parts, ",")
    font_name = name_parts[1]
    gsub(/^[ \t]+|[ \t]+$/, "", font_name) # Trim whitespace

    # Extract style info from the rest of the line
    style_info = tolower($0)
    
    style = ""
    if (style_info ~ /bold italic/) {
        style = "Bold Italic"
    } else if (style_info ~ /bold/) {
        style = "Bold"
    } else if (style_info ~ /italic/) {
        style = "Italic"
    } else {
        style = "Regular"
    }

    # Store styles in an associative array indexed by font name
    if (font_name != "") {
        if (!(style in styles[font_name])) {
            fonts[font_name] = (fonts[font_name] == "" ? style : fonts[font_name] ", " style)
            styles[font_name][style] = 1
        }
    }
}
END {
    for (f in fonts) {
        printf "%-40s | %s\n", f, fonts[f]
    }
}' "$INPUT_FILE" | sort
