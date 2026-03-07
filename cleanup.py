import os
import re

# The exact YAML front matter you locked in
yaml_template = """---
layout: post
title: "{title}"
author: "James McGinn / Solving Tornadoes"
tags: [archived research]
# jabrium_thread: "https://jabrium.com/your-thread-link-here"
---

"""

for filename in os.listdir('_posts'):
    if filename.endswith('.md'):
        filepath = os.path.join('_posts', filename)
        
        # Keep you in control: ask before touching the file
        answer = input(f"Clean up and format '{filename}'? (y/n): ")
        
        if answer.lower() == 'y':
            with open(filepath, 'r') as file:
                lines = file.readlines()
            
            title = "Archived Post" # Fallback title
            
            # 1. Strip the double-heading (assuming it is the first line starting with #)
            if lines and lines[0].startswith('#'):
                title = lines[0].replace('#', '').strip()
                lines.pop(0) # Removes the old heading from the body
            
            content = "".join(lines)
            
            # 2. The H2O Fix (catches h2o, H2O, H2o, etc., and injects HTML)
            content = re.sub(r'(?i)\bH2O\b', 'H<sub>2</sub>O', content)
            
            # 3. Combine the new YAML and the cleaned content
            final_text = yaml_template.format(title=title) + content
            
            with open(filepath, 'w') as file:
                file.write(final_text)
                
            print(f" -> Success: Cleaned up and added YAML to {filename}\n")
        else:
            print(f" -> Skipped {filename}\n")
