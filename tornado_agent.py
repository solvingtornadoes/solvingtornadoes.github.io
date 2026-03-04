import os
from googleapiclient.discovery import build
from google.oauth2 import service_account
from datetime import datetime

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
            
            # 1. Ensure the Jekyll publishing folder exists
            if not os.path.exists("_posts"):
                os.makedirs("_posts")
            
            # 2. Get today's date
            today = datetime.now().strftime("%Y-%m-%d")
            
            # 3. Sanitize the filename (forces lowercase, swaps spaces/underscores for hyphens)
            raw_name = item['name'].replace('.md', '').lower().replace(' ', '-').replace('_', '-')
            local_filename = f"_posts/{today}-{raw_name}.md"
            
            # 4. Save the file to the _posts folder
            with open(local_filename, 'wb') as f:
                f.write(content)
                
            # 5. Mark as processed in Google Drive
            service.files().update(
                fileId=item['id'], 
                body={'name': f"[PROCESSED] - {item['name']}"}
            ).execute()
            
            print(f"[SUCCESS]: Moved to {local_filename}")

        except Exception as e:
            print(f"[ERROR] on {item['name']}: {e}")

if __name__ == '__main__':
    watch_docs()
    print("\n=== BOT FINISHED: Jekyll will now build the index automatically ===")
