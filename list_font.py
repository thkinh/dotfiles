import re
from collections import defaultdict

def list_fonts(file_path):
    # Dictionary to store font names and their associated styles
    font_map = defaultdict(set)
    
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            for line in f:
                # Basic format expected: /path/to/font: Font Name:style=Style
                if ':' not in line:
                    continue
                
                parts = line.strip().split(':')
                if len(parts) < 2:
                    continue
                
                # The font name is usually the second part
                name = parts[1].strip().split(',')[0]
                
                # Check for styles in the remaining parts
                style_info = " ".join(parts[2:]).lower()
                
                if 'bold italic' in style_info:
                    font_map[name].add('Bold Italic')
                elif 'bold' in style_info:
                    font_map[name].add('Bold')
                elif 'italic' in style_info:
                    font_map[name].add('Italic')
                else:
                    font_map[name].add('Regular')

        # Print the consolidated results
        print(f"{'Font Name':<40} | {'Available Styles'}")
        print("-" * 65)
        for name in sorted(font_map.keys()):
            styles = sorted(list(font_map[name]))
            print(f"{name:<40} | {', '.join(styles)}")

    except FileNotFoundError:
        print("Error: The font file was not found.")

# Usage: list_fonts('your_font_file.txt')
list_fonts('fonts')
