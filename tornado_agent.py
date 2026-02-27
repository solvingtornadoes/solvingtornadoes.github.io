import os
from googleapiclient.discovery import build
from google.oauth2 import service_account
from googleapiclient.http import MediaIoBaseDownload
import io

# ================= SETTINGS =================
FOLDER_ID = '1_F9sB3CeRFBnBTNDEhkojqr1WPiS1rLb'
SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive']
# ============================================

def watch_inbox():
    creds = service_account.Credentials.from_service_account_file(
        SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    service = build('drive', 'v3', credentials=creds)

    print("\n=== THE HUB WATCHER: Scanning Project Hub ===")
    
    # Search for FILES only (no folders) that aren't processed
    query = "not name contains '[PROCESSED]' and mimeType != 'application/vnd.google-apps.folder' and trashed = false"
    results = service.files().list(q=query, fields="files(id, name, mimeType)").execute()
    items = results.get('files', [])

    if not items:
        print("Everything up to date.")
        return

    for item in items:
        print(f"Processing: {item['name']}")
        
        try:
            # Handle Google Docs vs Regular Files
            if 'application/vnd.google-apps.document' in item['mimeType']:
                request = service.files().export_media(fileId=item['id'], mimeType='text/plain')
            else:
                request = service.files().get_media(fileId=item['id'])
            
            # Download content
            content = request.execute()
            
            if not os.path.exists("website_drafts"):
                os.makedirs("website_drafts")
            
            # Save locally
            local_filename = f"website_drafts/{item['name']}.md"
            with open(local_filename, 'wb') as f:
                f.write(content)
                
            # Rename in Drive
            new_name = f"[PROCESSED] - {item['name']}"
            service.files().update(fileId=item['id'], body={'name': new_name}).execute()
            print(f"[SUCCESS]: Staged {item['name']}")

        except Exception as e:
            print(f"[ERROR] on {item['name']}: {e}")

if __name__ == '__main__':
    watch_inbox()
