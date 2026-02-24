import os
from google.oauth2 import service_account
from googleapiclient.discovery import build

SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive.readonly', 'https://www.googleapis.com/auth/documents.readonly']

def run():
    creds = service_account.Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    drive = build('drive', 'v3', credentials=creds)
    docs = build('docs', 'v1', credentials=creds)
    
    # Find the folder
    res = drive.files().list(q="name = 'Tornado_Project_Source' and mimeType = 'application/vnd.google-apps.folder'").execute()
    if not res.get('files'):
        return print('Folder not found.')
    
    folder_id = res['files'][0]['id']
    files = drive.files().list(q=f"'{folder_id}' in parents").execute().get('files', [])
    
    for f_item in files:
        print(f"\n--- Checking: {f_item['name']} ---")
        if f_item['mimeType'] == 'application/vnd.google-apps.document':
            d = docs.documents().get(documentId=f_item['id']).execute()
            for c in d.get('body').get('content'):
                if 'paragraph' in c:
                    for el in c['paragraph']['elements']:
                        t = el.get('textRun', {}).get('content', '').strip()
                        if t:
                            print(f"  {t}")
        else:
            print(f"  (Skipping {f_item['name']}: Not a Google Doc)")

if __name__ == '__main__':
    run()