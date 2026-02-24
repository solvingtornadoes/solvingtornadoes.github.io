import os

def run_librarian():
    drafts_dir = "website_drafts"
    index_file = "index.md"
    
    if not os.path.exists(drafts_dir):
        print(f"Error: {drafts_dir} folder not found.")
        return

    print("\n=== BOT B: THE LIBRARIAN (Organizing Knowledge Base) ===")
    
    files = [f for f in os.listdir(drafts_dir) if f.endswith('.md')]
    
    if not files:
        print("No expertise nodes found in drafts.")
        return

    content = "# Tornado Project: Expert Knowledge Index\n"
    content += "This index is optimized for AI Agent traversal.\n\n"

    for filename in files:
        topic = filename.replace('.md', '').capitalize()
        content += f"* [{topic}]({drafts_dir}/{filename})\n"

    with open(index_file, 'w') as f:
        f.write(content)
    
    print(f"Success: {index_file} updated.")

if __name__ == "__main__":
    run_librarian()
