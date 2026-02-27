from googleapiclient.discovery import build
from google.oauth2 import service_account

SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive']

def open_conduit():
    creds = service_account.Credentials.from_service_account_file(
        SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    service = build('drive', 'v3', credentials=creds)

    # Search for the existing folder first
    results = service.files().list(q="name = 'SOLVING_TORNADOES_DROPZONE' and trashed = false", fields="files(id)").execute()
    items = results.get('files', [])
    
    if not items:
        print("Creating a fresh SOLVING_TORNADOES_DROPZONE...")
        folder_metadata = {
            'name': 'SOLVING_TORNADOES_DROPZONE',
            'mimeType': 'application/vnd.google-apps.folder'
        }
        folder = service.files().create(body=folder_metadata, fields='id').execute()
        folder_id = folder.get('id')
    else:
        folder_id = items[0]['id']

    # FIX: Using 'writer' instead of 'editor'
    public_permission = {
        'type': 'anyone',
        'role': 'writer' 
    }
    
    try:
        service.permissions().create(fileId=folder_id, body=public_permission).execute()
        print(f"\n=== CONDUIT OPEN ===")
        print(f"Paste this into your browser to access the folder:")
        print(f"https://drive.google.com/drive/folders/{folder_id}")
    except Exception as e:
        print(f"Error granting permission: {e}")

if __name__ == '__main__':
    open_conduit()
