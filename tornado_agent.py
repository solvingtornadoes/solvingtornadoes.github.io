import os
from googleapiclient.discovery import build
from google.oauth2 import service_account

# ================= SETTINGS =================
# This is the secret ID for your SOLVING_TORNADOES_DROPZONE
FOLDER_ID = '1n86T4Hrs3W0iDTQvOE8luJdzdJX2BkH3' 
SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive']
# ============================================

def watch_docs():
    creds = service_account.Credentials.from_service_account_file(
        SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    service = build('drive', 'v3', credentials=creds)

    print("\n=== THE DOCUMENT WATCHER: Scanning Dropzone ===")
    
    query = (
        f"'{FOLDER_ID}' in parents and "
        "not name contains '[PROCESSED]' and "
        "trashed = false and "
        "(mimeType = 'application/vnd.google-apps.document' or mimeType = 'text/plain')"
    )
    
    results = service.files().list(q=query, fields="files(id, name, mimeType)").execute()
    items = results.get('files', [])

    if not items:
        print("No new documents found. All research is processed.")
        return

    for item in items:
        print(f"Reading Insight: {item['name']}")
        try:
            if 'application/vnd.google-apps.document' in item['mimeType']:
                request = service.files().export_media(fileId=item['id'], mimeType='text/plain')
            else:
                request = service.files().get_media(fileId=item['id'])
            
            content = request.execute()
            
            if not os.path.exists("website_drafts"):
                os.makedirs("website_drafts")
            
            local_filename = f"website_drafts/{item['name'][:50].replace(' ', '_')}.md"
            with open(local_filename, 'wb') as f:
                f.write(content)
                
            service.files().update(
                fileId=item['id'], 
                body={'name': f"[PROCESSED] - {item['name']}"}
            ).execute()
            
            print(f"[SUCCESS]: {item['name']} moved to local staging.")

        except Exception as e:
            print(f"[ERROR] on {item['name']}: {e}")

def rebuild_index():
    print("\n=== REBUILDING RESEARCH INDEX ===")
    drafts_dir = "website_drafts"
    if not os.path.exists(drafts_dir):
        print("No drafts directory found to index.")
        return

    files = sorted([f for f in os.listdir(drafts_dir) if f.endswith('.md')])
    
    with open("index.md", "w") as index_file:
        index_file.write("# Solving Tornadoes: Research Hub\n\n")
        index_file.write("## Current Staged Research\n")
        index_file.write(f"*Last updated: automatically by Tornado Agent*\n\n")
        
        for f in files:
            display_name = f.replace('_', ' ').replace('.md', '')
            index_file.write(f"* [{display_name}]({drafts_dir}/{f})\n")
            
    print("[SUCCESS]: RESEARCH_INDEX.md updated.")

if __name__ == '__main__':
    watch_docs()
    rebuild_index()
