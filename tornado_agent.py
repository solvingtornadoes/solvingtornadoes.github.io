import os
from google.oauth2 import service_account
from googleapiclient.discovery import build
from datetime import datetime

SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive.readonly', 'https://www.googleapis.com/auth/documents.readonly']

def run():
    creds = service_account.Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    drive = build('drive', 'v3', credentials=creds)
    docs = build('docs', 'v1', credentials=creds)
    
    print("\n=== BOT A: THE CHUNKER (Tornado Project) ===")
    topic = input("Collaborative Check: What is our daily topic? ").strip()
    
    res = drive.files().list(q="name = 'Tornado_Project_Source'").execute().get('files', [])
    if not res: return
    files = drive.files().list(q=f"'{res[0]['id']}' in parents").execute().get('files', [])
    
    found_content = []
    for f in files:
        if f['mimeType'] == 'application/vnd.google-apps.document':
            doc = docs.documents().get(documentId=f['id']).execute()
            for item in doc.get('body').get('content', []):
                if 'paragraph' in item:
                    text = "".join([el.get('textRun', {}).get('content', '') for el in item['paragraph'].get('elements', [])]).strip()
                    if topic.lower() in text.lower():
                        found_content.append(text)

    if not found_content:
        print(f"No chunks found for '{topic}'.")
        return

    full_chunk = "\n\n".join(found_content)
    print(f"\n--- PROPOSED CHUNK ---\n{full_chunk}\n" + "-"*40)
    
    confirm = input("\nDo you approve this chunk for the Knowledge Base? (y/n): ")
    if confirm.lower() == 'y':
        if not os.path.exists("website_drafts"):
            os.makedirs("website_drafts")
        
        safe_name = topic.lower().replace(" ", "_")
        filename = f"website_drafts/{safe_name}.md"
        
        md_content = f"---\ntopic: {topic}\nexpert: solvingtornadoes\ndate: {datetime.now().strftime('%Y-%m-%d')}\n---\n\n# {topic}\n\n{full_chunk}"
        
        with open(filename, "w") as f:
            f.write(md_content)
        print(f"\n[SUCCESS]: Saved to {filename}")

if __name__ == "__main__":
    run()