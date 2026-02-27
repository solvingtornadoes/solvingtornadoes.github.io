[200~# First, install the necessary library
pip install google-api-python-client google-auth-httplib2 google-auth-oauthlib
# Create the test script
cat << 'EOF' > test_handshake.py
import os
from googleapiclient.discovery import build
from google.oauth2 import service_account

SCOPES = ['https://www.googleapis.com/auth/drive.readonly']
SERVICE_ACCOUNT_FILE = 'drive-key.json'

creds = service_account.Credentials.from_service_account_file(
        SERVICE_ACCOUNT_FILE, scopes=SCOPES)

service = build('drive', 'v3', credentials=creds)

# This lists the 10 most recent files the bot can see
results = service.files().list(
    pageSize=10, fields="nextPageToken, files(id, name)").execute()
items = results.get('files', [])

if not items:
    print('No files found. Did you share the folder with the service account?')
else:
    print('Handshake Success! The bot sees these files:')
    for item in items:
        print(f" - {item['name']}")
EOF

# Run the test
python3 test_handshake.py~
[200~rm -f test_handshake.py test_handshake.py~~
[200~bind 'set enable-bracketed-paste off'~
echo 5 > "/home/solvingtornadoes/.local/share/cros-motd"
cat << 'EOF' > test_handshake.py
import os
from googleapiclient.discovery import build
from google.oauth2 import service_account

SCOPES = ['https://www.googleapis.com/auth/drive.readonly']
SERVICE_ACCOUNT_FILE = 'drive-key.json'

creds = service_account.Credentials.from_service_account_file(
        SERVICE_ACCOUNT_FILE, scopes=SCOPES)

service = build('drive', 'v3', credentials=creds)

results = service.files().list(
    pageSize=10, fields="nextPageToken, files(id, name)").execute()
items = results.get('files', [])

if not items:
    print('No files found. Did you share the folder with the service account?')
else:
    print('Handshake Success! The bot sees these files:')
    for item in items:
        print(f" - {item['name']}")
EOF

python3 test_handshake.py
[200~python3 -m pip install --break-system-packages google-api-python-client google-auth-httplib2 google-auth-oauthlib~
bind 'set enable-bracketed-paste off'
pip install google-api-python-client --break-system-packages
sudo apt update
sudo apt install python3-pip -y
python3 test_handshake.py
dpkg --print-architecture
[200~# Enter your bot's brain space
source ~/bot_env/bin/activate

# Run the test
python3 test_handshake.py~
# Enter your bot's brain space
source ~/bot_env/bin/activate
# Run the test
python3 test_handshake.py
# Enter your bot's brain space
source ~/bot_env/bin/activate
# Run the test
python3 test_handshake.py
[200~source ~/bot_env/bin/activate~
[200~python3 test_handshake.py~
which python3
[200~python3 test_handshake.py~
python3 test_handshake.py
source ~/bot_env/bin/activate
python3 -m venv ~/bot_env
sudo apt update && sudo apt install python3-venv -y
source ~/bot_env/bin/activate
python3 -m venv ~/bot_env
source ~/bot_env/bin/activate
# Install the Google libraries
pip install google-api-python-client google-auth-httplib2 google-auth-oauthlib
# Run the test
python3 test_handshake.py
find ~ -name "*.json"
home/solvingtornadoes/bot_env/lib/python3.11/site-packages/googleapiclient/discovery_cache/documents/youtubeAnalytics.v1.json
/home/solvingtornadoes/bot_env/lib/python3.11/site-packages/googleapiclient/discovery_cache/documents/youtubeAnalytics.v2.json
/home/solvingtornadoes/bot_env/lib/python3.11/site-packages/googleapiclient/discovery_cache/documents/youtubereporting.v1.json
/home/solvingtornadoes/solving-tornadoes-bot-5756cf2ff57b.json
(bot_env) solvingtornadoes@penguin:~$ ^C
(bot_env) solvingtornadoes@penguin:~$ find ~ -name "*.json"
mv /home/solvingtornadoes/solving-tornadoes-bot-5756cf2ff57b.json ~/drive-key.json
python3 test_handshake.py
[200~pip install google-api-python-client google-auth-httplib2 google-auth-oauthlib~
pip install google-api-python-client google-auth-httplib2 google-auth-oauthlib
python3 tornado_agent.pypython3 tornado_agent.py
cat << 'EOF' > ~/tornado_agent.py
import os
from google.oauth2 import service_account
from googleapiclient.discovery import build

SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive.readonly', 'https://www.googleapis.com/auth/documents.readonly']

def get_agent_brain():
    creds = service_account.Credentials.from_service_account_file(
        SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    drive_service = build('drive', 'v3', credentials=creds)
    docs_service = build('docs', 'v1', credentials=creds)
    return drive_service, docs_service

def read_mission_statement():
    drive, docs = get_agent_brain()
    results = drive.files().list(
        q="name = 'Tornado Mission Statement'", 
        fields="files(id, name)").execute()
    items = results.get('files', [])

    if not items:
        print("I couldn't find the Mission Statement file!")
        return

    file_id = items[0]['id']
    doc = docs.documents().get(documentId=file_id).execute()
    content = doc.get('body').get('content')
    
    print(f"\n--- Reading: {doc.get('title')} ---\n")
    for element in content:
        if 'paragraph' in element:
            for run in element.get('paragraph').get('elements'):
                text = run.get('textRun', {}).get('content', '')
                if text.strip():
                    print(text.strip())

if __name__ == '__main__':
    read_mission_statement()
EOF

cat << 'EOF' > ~/tornado_agent.py
import os
from google.oauth2 import service_account
from googleapiclient.discovery import build

SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive.readonly', 'https://www.googleapis.com/auth/documents.readonly']

def get_agent_brain():
    creds = service_account.Credentials.from_service_account_file(
        SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    drive_service = build('drive', 'v3', credentials=creds)
    docs_service = build('docs', 'v1', credentials=creds)
    return drive_service, docs_service

def read_mission_statement():
    drive, docs = get_agent_brain()
    results = drive.files().list(
        q="name = 'Tornado Mission Statement'", 
        fields="files(id, name)").execute()
    items = results.get('files', [])

    if not items:
        print("I couldn't find the Mission Statement file!")
        return

    file_id = items[0]['id']
    doc = docs.documents().get(documentId=file_id).execute()
    content = doc.get('body').get('content')
    
    print(f"\n--- Reading: {doc.get('title')} ---\n")
    for element in content:
        if 'paragraph' in element:
            for run in element.get('paragraph').get('elements'):
                text = run.get('textRun', {}).get('content', '')
                if text.strip():
                    print(text.strip())

if __name__ == '__main__':
    read_mission_statement()
EOF

source ~/bot_env/bin/activate
python3 tornado_agent.py
sed -i "s/name = 'Tornado Mission Statement'/name = 'Tornado_Project_Source'/" ~/tornado_agent.py
python3 tornado_agent.py
python3 -c "
import os
from google.oauth2 import service_account
from googleapiclient.discovery import build
creds = service_account.Credentials.from_service_account_file('drive-key.json', scopes=['https://www.googleapis.com/auth/drive.readonly'])
drive = build('drive', 'v3', credentials=creds)
res = drive.files().list(q=\"name = 'Tornado_Project_Source'\", fields='files(id, name, mimeType)').execute()
print(res.get('files', [{}])[0])
"
cat << 'EOF' > ~/tornado_agent.py
import os
from google.oauth2 import service_account
from googleapiclient.discovery import build

SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive.readonly', 'https://www.googleapis.com/auth/documents.readonly']

def get_agent_brain():
    creds = service_account.Credentials.from_service_account_file(
        SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    drive_service = build('drive', 'v3', credentials=creds)
    docs_service = build('docs', 'v1', credentials=creds)
    return drive_service, docs_service

def read_folder_contents():
    drive, docs = get_agent_brain()
    
    # 1. Find the folder ID
    folder_res = drive.files().list(
        q="name = 'Tornado_Project_Source' and mimeType = 'application/vnd.google-apps.folder'", 
        fields="files(id)").execute()
    folders = folder_res.get('files', [])
    
    if not folders:
        print("Folder not found.")
        return
    
    folder_id = folders[0]['id']
    
    # 2. List files inside that folder
    file_res = drive.files().list(
        q=f"'{folder_id}' in parents", 
        fields="files(id, name, mimeType)").execute()
    files = file_res.get('files', [])
    
    print(f"\n--- Found {len(files)} files in Tornado_Project_Source ---\n")
    
    for f in files:
        print(f"Opening: {f['name']}...")
        if f['mimeType'] == 'application/vnd.google-apps.document':
            doc = docs.documents().get(documentId=f['id']).execute()
            content = doc.get('body').get('content')
            for element in content:
                if 'paragraph' in element:
                    for run in element.get('paragraph').get('elements'):
                        text = run.get('textRun', {}).get('content', '').strip()
                        if text: print(f"  > {text}")
        else:
            print(f"  [Skipping {f['name']} - Not a Google Doc]")

if __name__ == '__main__':
    read_folder_contents()
EOF

rm ~/tornado_agent.py
cat << 'EOF' > ~/tornado_agent.py
import os
from google.oauth2 import service_account
from googleapiclient.discovery import build

SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive.readonly', 'https://www.googleapis.com/auth/documents.readonly']

def get_services():
    creds = service_account.Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    return build('drive', 'v3', credentials=creds), build('docs', 'v1', credentials=creds)

def run():
    drive, docs = get_services()
    # Find the folder
    res = drive.files().list(q="name = 'Tornado_Project_Source' and mimeType = 'application/vnd.google-apps.folder'").execute()
    if not res.get('files'): return print("Folder not found.")
    
    # List files in folder
    folder_id = res['files'][0]['id']
    files = drive.files().list(q=f"'{folder_id}' in parents").execute().get('files', [])
    
    for f in files:
        print(f"\n--- Checking: {f['name']} ---")
        if f['mimeType'] == 'application/vnd.google-apps.document':
            d = docs.documents().get(documentId=f['id']).execute()
            for content in d.get('body').get('content'):
                if 'paragraph' in content:
                    for element in content['paragraph']['elements']:
                        text = element.get('textRun', {}).get('content', '').strip()
                        if text: print(f"  {text}")
        else:
            print(f"  (Skipping {f['name']}: Not a Doc)")

if __name__ == '__main__':
    run()
EOF

python3 -c "with open('tornado_agent.py', 'w') as f: f.write(\"import os\nfrom google.oauth2 import service_account\nfrom googleapiclient.discovery import build\n\nSERVICE_ACCOUNT_FILE = 'drive-key.json'\nSCOPES = ['https://www.googleapis.com/auth/drive.readonly', 'https://www.googleapis.com/auth/documents.readonly']\n\ndef run():\n    creds = service_account.Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)\n    drive, docs = build('drive', 'v3', credentials=creds), build('docs', 'v1', credentials=creds)\n    res = drive.files().list(q=\\\"name = 'Tornado_Project_Source' and mimeType = 'application/vnd.google-apps.folder'\\\").execute()\n    if not res.get('files'): return print('Folder not found.')\n    f_id = res['files'][0]['id']\n    files = drive.files().list(q=f\\\"'{f_id}' in parents\\\").execute().get('files', [])\n    for f_item in files:\n        print(f'\\n--- Checking: {f_item[\\\"name\\\"]} ---')\n        if f_item['mimeType'] == 'application/vnd.google-apps.document':\n            d = docs.documents().get(documentId=f_item['id']).execute()\n            for c in d.get('body').get('content'):\n                if 'paragraph' in c:\n                    for el in c['paragraph']['elements']:\n                        t = el.get('textRun', {}).get('content', '').strip()\n                        if t: print(f'  {t}')\n        else: print(f'  (Skipping {f_item[\\\"name\\\"]}: Not a Doc)')\n\nif __name__ == '__main__': run()\")"
python3 tornado_agent.py
code tornado_agent.py
python3 tornado_agent.py
source ~/bot_env/bin/activate
python3 tornado_agent.py
code tornado_agent.py
python3 tornado_agent.py
cat << 'EOF' > ~/tornado_agent.py
import os
from google.oauth2 import service_account
from googleapiclient.discovery import build

SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive.readonly', 'https://www.googleapis.com/auth/documents.readonly']

def run():
    creds = service_account.Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    drive, docs = build('drive', 'v3', credentials=creds), build('docs', 'v1', credentials=creds)
    res = drive.files().list(q="name = 'Tornado_Project_Source' and mimeType = 'application/vnd.google-apps.folder'").execute()
    if not res.get('files'): return print('Folder not found.')
    f_id = res['files'][0]['id']
    files = drive.files().list(q=f"'{f_id}' in parents").execute().get('files', [])
    for f_item in files:
        print(f"\n--- Checking: {f_item['name']} ---")
        if f_item['mimeType'] == 'application/vnd.google-apps.document':
            d = docs.documents().get(documentId=f_item['id']).execute()
            for c in d.get('body').get('content'):
                if 'paragraph' in c:
                    for el in c['paragraph']['elements']:
                        t = el.get('textRun', {}).get('content', '').strip()
                        if t: print(f"  [FOUND]: {t}")
                if 'table' in c:
                    for row in c['table']['tableRows']:
                        for cell in row['tableCells']:
                            for cell_p in cell['content']:
                                if 'paragraph' in cell_p:
                                    for el in cell_p['paragraph']['elements']:
                                        t = el.get('textRun', {}).get('content', '').strip()
                                        if t: print(f"  [TABLE]: {t}")
        else: print(f"  (Skipping: Not a Doc)")

if __name__ == '__main__': run()
EOF

nano tornado_agent.py
code tornado_agent.py
mv "tornado_agent.py 2" tornado_agent.py
import os
from google.oauth2 import service_account
from googleapiclient.discovery import build
SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive.readonly', 'https://www.googleapis.com/auth/documents.readonly']
def run():
if __name__ == '__main__':;     run() [200~sudo apt-get purge code -y && sudo apt-get autoremove -y~
sudo apt-get purge code -y
sudo apt-get autoremove -y
rm tornado_agent*
sudo apt install mousepad -y
mousepad tornado_agent.py
[200~python3 tornado_agent.py~
[200~source bot_env/bin/activate~
[200~mousepad tornado_agent.py~
bot_env/bin/activate
source bot_env/bin
source bot_env/bin/activate
mousepad tornado_agent.py
python3 tornado_agent.py
python tornado_agent.py
python3 tornado_agent.py
cat << 'EOF' > tornado_agent.py
import os
from google.oauth2 import service_account
from googleapiclient.discovery import build

SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive.readonly']

def run():
    print("--- BOT IS AWAKE ---")
    try:
        creds = service_account.Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)
        drive = build('drive', 'v3', credentials=creds)
        print("--- GOOGLE CONNECTED ---")
        res = drive.files().list(q="name = 'Tornado_Project_Source'").execute().get('files', [])
        if res:
            print(f"--- SUCCESS: Found Folder {res[0]['name']} ---")
        else:
            print("--- ERROR: Cannot find folder ---")
    except Exception as e:
        print(f"--- ERROR: {e} ---")

if __name__ == "__main__":
    run()
EOF

python3 tornado_agent.py
cat << 'EOF' > tornado_agent.py
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
    res = drive.files().list(q="name = 'Tornado_Project_Source'").execute().get('files', [])
    folder_id = res[0]['id']
    
    # List files in folder
    files = drive.files().list(q=f"'{folder_id}' in parents").execute().get('files', [])
    
    for f in files:
        print(f"\n--- READING: {f['name']} ---")
        if f['mimeType'] == 'application/vnd.google-apps.document':
            doc = docs.documents().get(documentId=f['id']).execute()
            content = doc.get('body').get('content')
            for item in content:
                if 'paragraph' in item:
                    for el in item['paragraph']['elements']:
                        text = el.get('textRun', {}).get('content', '').strip()
                        if text: print(text)
        else:
            print("[Non-Doc file skipped]")

if __name__ == "__main__":
    run()
EOF

cat << 'EOF' > tornado_agent.py
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
    res = drive.files().list(q="name = 'Tornado_Project_Source'").execute().get('files', [])
    folder_id = res[0]['id']
    
    # List files in folder
    files = drive.files().list(q=f"'{folder_id}' in parents").execute().get('files', [])
    
    for f in files:
        print(f"\n--- READING: {f['name']} ---")
        if f['mimeType'] == 'application/vnd.google-apps.document':
            doc = docs.documents().get(documentId=f['id']).execute()
            content = doc.get('body').get('content')
            for item in content:
                if 'paragraph' in item:
                    for el in item['paragraph']['elements']:
                        text = el.get('textRun', {}).get('content', '').strip()
                        if text: print(text)
        else:
            print("[Non-Doc file skipped]")

if __name__ == "__main__":
    run()
EOF

echo "    run()" >> tornado_agent.py
cat << 'EOF' > tornado_agent.py
import os
from google.oauth2 import service_account
from googleapiclient.discovery import build

SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive.readonly', 'https://www.googleapis.com/auth/documents.readonly']

def run():
    creds = service_account.Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    drive = build('drive', 'v3', credentials=creds)
    docs = build('docs', 'v1', credentials=creds)
    res = drive.files().list(q="name = 'Tornado_Project_Source'").execute().get('files', [])
    if not res:
        print("Folder not found.")
        return
    folder_id = res[0]['id']
    files = drive.files().list(q=f"'{folder_id}' in parents").execute().get('files', [])
    for f in files:
        print(f"\n--- READING: {f['name']} ---")
        if f['mimeType'] == 'application/vnd.google-apps.document':
            doc = docs.documents().get(documentId=f['id']).execute()
            for item in doc.get('body').get('content'):
                if 'paragraph' in item:
                    for el in item['paragraph']['elements']:
                        text = el.get('textRun', {}).get('content', '').strip()
                        if text: print(text)

if __name__ == "__main__":
    run()
EOF

python3 tornado_agent.py
cat << 'EOF' > tornado_agent.py
import os
from google.oauth2 import service_account
from googleapiclient.discovery import build

SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive.readonly', 'https://www.googleapis.com/auth/documents.readonly']

def run():
    creds = service_account.Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    drive = build('drive', 'v3', credentials=creds)
    docs = build('docs', 'v1', credentials=creds)
    res = drive.files().list(q="name = 'Tornado_Project_Source'").execute().get('files', [])
    if not res: return
    folder_id = res[0]['id']
    files = drive.files().list(q=f"'{folder_id}' in parents").execute().get('files', [])
    for f in files:
        print(f"\n--- READING: {f['name']} ---")
        if f['mimeType'] == 'application/vnd.google-apps.document':
            doc = docs.documents().get(documentId=f['id']).execute()
            # This part looks everywhere for text
            for item in doc.get('body').get('content'):
                if 'paragraph' in item:
                    for el in item['paragraph']['elements']:
                        t = el.get('textRun', {}).get('content', '').strip()
                        if t: print(f"  > {t}")
                elif 'table' in item:
                    for row in item['table']['tableRows']:
                        for cell in row['tableCells']:
                            for cp in cell['content']:
                                if 'paragraph' in cp:
                                    for el in cp['paragraph']['elements']:
                                        t = el.get('textRun', {}).get('content', '').strip()
                                        if t: print(f"  [TABLE]: {t}")

if __name__ == "__main__":
    run()
EOF

cat << 'EOF' > tornado_agent.py
import os
from google.oauth2 import service_account
from googleapiclient.discovery import build

SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive.readonly', 'https://www.googleapis.com/auth/documents.readonly']

def run():
    creds = service_account.Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    drive = build('drive', 'v3', credentials=creds)
    docs = build('docs', 'v1', credentials=creds)
    res = drive.files().list(q="name = 'Tornado_Project_Source'").execute().get('files', [])
    if not res: return
    folder_id = res[0]['id']
    files = drive.files().list(q=f"'{folder_id}' in parents").execute().get('files', [])
    for f in files:
        print(f"\n--- READING: {f['name']} ---")
        if f['mimeType'] == 'application/vnd.google-apps.document':
            doc = docs.documents().get(documentId=f['id']).execute()
            for item in doc.get('body').get('content'):
                if 'paragraph' in item:
                    for el in item['paragraph']['elements']:
                        t = el.get('textRun', {}).get('content', '').strip()
                        if t: print(f"  > {t}")
                elif 'table' in item:
                    for row in item['table']['tableRows']:
                        for cell in row['tableCells']:
                            for cp in cell['content']:
                                if 'paragraph' in cp:
                                    for el in cp['paragraph']['elements']:
                                        t = el.get('textRun', {}).get('content', '').strip()
                                        if t: print(f"  [TABLE]: {t}")

if __name__ == "__main__":
    run()
EOF

python3 tornado_agent.py
mousepad tornado_agent.py
python3 tornado_agent.py
mousepad tornado_agent.py
python3 tornado_agent.py
cat << 'EOF' > tornado_agent.py
import os
from google.oauth2 import service_account
from googleapiclient.discovery import build

SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive.readonly', 'https://www.googleapis.com/auth/documents.readonly']

def run():
    creds = service_account.Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    drive = build('drive', 'v3', credentials=creds)
    docs = build('docs', 'v1', credentials=creds)
    
    res = drive.files().list(q="name = 'Tornado_Project_Source'").execute().get('files', [])
    if not res:
        print("Folder not found.")
        return
    
    folder_id = res[0]['id']
    files = drive.files().list(q=f"'{folder_id}' in parents").execute().get('files', [])
    
    if not files:
        print("The folder is empty.")
        return

    for f in files:
        print(f"\n--- READING: {f['name']} ---")
        try:
            doc = docs.documents().get(documentId=f['id']).execute()
            content = doc.get('body').get('content', [])
            found = False
            for item in content:
                if 'paragraph' in item:
                    for el in item['paragraph'].get('elements', []):
                        text = el.get('textRun', {}).get('content', '').strip()
                        if text:
                            print(f"  > {text}")
                            found = True
            if not found:
                print("  [SYSTEM]: File opened, but no paragraph text found.")
        except Exception as e:
            print(f"  [ERROR]: Could not read file content. Check permissions. {e}")

if __name__ == "__main__":
    run()
EOF

python3 tornado_agent.py
cat << 'EOF' > tornado_agent.py
import os
from google.oauth2 import service_account
from googleapiclient.discovery import build
import json

SERVICE_ACCOUNT_FILE = 'drive-key.json'
SCOPES = ['https://www.googleapis.com/auth/drive.readonly', 'https://www.googleapis.com/auth/documents.readonly']

def run():
    creds = service_account.Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    drive = build('drive', 'v3', credentials=creds)
    docs = build('docs', 'v1', credentials=creds)
    
    res = drive.files().list(q="name = 'Tornado_Project_Source'").execute().get('files', [])
    if not res: return
    
    files = drive.files().list(q=f"'{res[0]['id']}' in parents").execute().get('files', [])
    
    for f in files:
        print(f"\n--- READING: {f['name']} ---")
        if f['mimeType'] == 'application/vnd.google-apps.document':
            doc = docs.documents().get(documentId=f['id']).execute()
            
            # Convert the whole document to a giant string of text
            full_content = json.dumps(doc)
            
            # This logic hunts for the "content" keys manually
            import re
            text_chunks = re.findall(r'"content": "([^"]+)"', full_content)
            
            if not text_chunks:
                # Try one more backup way
                print("  [SYSTEM]: Standard text not found, trying raw scan...")
                for item in doc.get('body').get('content', []):
                    if 'paragraph' in item:
                        for el in item['paragraph'].get('elements', []):
                            t = el.get('textRun', {}).get('content', '').strip()
                            if t: print(f"  > {t}")
            else:
                for chunk in text_chunks:
                    clean_chunk = chunk.replace('\\n', '').strip()
                    if clean_chunk:
                        print(f"  > {clean_chunk}")

if __name__ == "__main__":
    run()
EOF

python3 tornado_agent.py
mousepad tornado_agent.py
python3 tornado_agent,py
python3 tornado_agent.py
mousepad tornado_agent.py
python3 tornado_agent.py
(bot_env) solvingtornadoes@penguin:~$ mousepad tornado_agent.py
(bot_env) solvingtornadoes@penguin:~$ python3 tornado_agent.py
What topic are you looking to post? (e.g., 'Mission', 'Vortex'):mission
python3 tornado_agent.py
mousepad librarian_bot.py
(bot_env) solvingtornadoes@penguin:~$ mousepad librarian_bot.py
mousepad librarian_bot.py
python3 librarian_bot.py
(bot_env) solvingtornadoes@penguin:~$ python3 librarian_bot.py
Error: website_drafts folder not found.
(bot_env) solvingtornadoes@penguin:~$ Error: website_drafts folder not found.
(bot_env) solvingtornadoes@penguin:~$ (bot_env) solvingtornadoes@penguin:~$ python3 librarian_bot.py
Error: website_drafts folder not found.
(bot_env) solvingtornadoes@penguin:~$ 
mkdir -p website_drafts
python3 tornado_agent.py
What topic are you looking to post? (e.g., 'Mission', 'Vortex'): Mission
--- EXTRACTING CONTENT FOR: MISSION ---
[READY TO POST]:
Mission:
[READY TO POST]:
Your "abundance" of raw research, data, and mission statements.
[READY TO POST]:
. Instead of a flat blog post, each piece of data (like a pressure reading or a mission objective) serves as a "node" that can be discussed or expanded upon.
(bot_env) solvingtornadoes@penguin:~$ What topic are you looking to post? (e.g., 'Mission', 'Vortex'): Mission
--- EXTRACTING CONTENT FOR: MISSION ---
[READY TO POST]:
Mission:
[READY TO POST]:
Your "abundance" of raw research, data, and mission statements.
[READY TO POST]:
. Instead of a flat blog post, each piece of data (like a pressure reading or a mission objective) serves as a "node" that can be discussed or expanded upon.
(bot_env) solvingtornadoes@penguin:~$ mousepad tornado_agent.py
mousepad tornado_agent.py
python3 tornado_agent.py
clr
python3 tornado_agent.py
python3 librarian_bot.py
cat library_index.md
cat website_drafts/mission.md
git --version
git init
git remote add origin https://github.com/solvingtornadoes/solvingtornadoes.github.io.git
git remote -v
git pull origin main
ls
git add library_index.md website_drafts/
ls
git commit -m "Initial AI-Ready Index and Mission Node"
git config --global user.email "solvingtornadoes@gmail.com"
git config --global user.name "James McGinn"
git commit -m "Initial AI-Ready Index and Mission Node"
git push origin main
git branch -M main
git push -u origin main
mv library_index.md index.md
git add index.md library_index.md
git commit -m "Rename index for automatic web loading"
git push
(bot_env) solvingtornadoes@penguin:~$ git push
Username for 'https://github.com': solvingtornadoes
Password for 'https://solvingtornadoes@github.com': 
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Delta compression using up to 4 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (2/2), 249 bytes | 249.00 KiB/s, done.
Total 2 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/solvingtornadoes/solvingtornadoes.github.io.git
(bot_env) solvingtornadoes@pen
nano librarian_bot.py
sudo apt update && sudo apt install nano -y
nano librarian_bot.py
sudo apt update && sudo apt install nano -y
nano librarian_bot.py
python3 librarian_bot.py
nano librarian_bot.py
cat <<EOF > librarian_bot.py
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
EOF

python3 librarian_bot.py
git add index.md librarian_bot.py
git commit -m "Update Librarian script and regenerate index"
git push
pwd
ls
python3 tornado_agent.py
solvingtornadoes@penguin:~$ python3 tornado_agent.py
Traceback (most recent call last):
ModuleNotFoundError: No module named 'google'
solvingtornadoes@penguin:~$ source bot_env/bin/activate
source bot_env/bin/activate
python3 tornado_agent.py
solvingtornadoes@penguin:~$ source bot_env/bin/activate
(bot_env) solvingtornadoes@penguin:~$ python3 tornado_agent.py
=== BOT A: THE CHUNKER (Tornado Project) ===
Collaborative Check: What is our daily topic? The Failure of Buoyancy and the Reality of Scale
No chunks found for 'The Failure of Buoyancy and the Reality of Scale'.
(bot_env) solvingtornadoes@penguin:~$ python3 librarian_bot.py
python3 librarian_bot.py
git add .
git commit -m "Add Buoyancy and Scale concept"
git push
git filter-branch --force --index-filter "git rm --cached --ignore-unmatch drive-key.json" --prune-empty --tag-name-filter cat -- --all
git push origin --force --all
[200~Dear Developer,
We detected and will disable a publicly exposed service account authentication credential associated with the following Google Cloud Platform account:
tornado-bot@solving-tornadoes-bot.iam.gserviceaccount.com with key ID 5756cf2ff57b21f7f9b10ea9f486eae4997d5716
This key was found at the following URL: https://github.com/solvingtornadoes/solvingtornadoes.github.io/blob/a2f0d526db853e8df971dc97e101c5b5a72b589d/drive-key.json
For a subset of abuse issues, we send abuse notifications in log format. Please log in to your console and review this abuse notification in Cloud Logging.
To prevent potential security and abuse risks, this service account authentication credential will be disabled in accordance with your organisational policy for 'Service account key exposure response'. Your service account credential may have been inadvertently published in public sources or websites (for instance, the credentials were mistakenly uploaded to a service like GitHub). Please note that as the project/account owner, you are responsible for securing your resources.  
Immediate action is required to secure your account(s). We strongly recommend that you take the following steps:
Log in to the Google Cloud Console and review the activity on your account. 
Rotate the credential for the disabled service account. 
Take immediate steps to ensure that your service account credentials are not embedded in public source code systems, stored in download directories or unintentionally shared in other ways.
Learn more about responding to abuse notifications and warnings
The security of your Google Cloud Platform account(s) is important to us. You can find more information on securely using IAM here, and also recommend best practices for keeping service account keys safe. Please let us know if you have additional questions by contacting Google Cloud Support.
Request an appeal
Yours sincerely,
Your Google Cloud Platform/API Trust & Safety team
Dear Developer,
We detected and will disable a publicly exposed service account authentication credential associated with the following Google Cloud Platform account:
tornado-bot@solving-tornadoes-bot.iam.gserviceaccount.com with key ID 5756cf2ff57b21f7f9b10ea9f486eae4997d5716
This key was found at the following URL: https://github.com/solvingtornadoes/solvingtornadoes.github.io/blob/a2f0d526db853e8df971dc97e101c5b5a72b589d/drive-key.json
For a subset of abuse issues, we send abuse notifications in log format. Please log in to your console and review this abuse notification in Cloud Logging.
To prevent potential security and abuse risks, this service account authentication credential will be disabled in accordance with your organisational policy for 'Service account key exposure response'. Your service account credential may have been inadvertently published in public sources or websites (for instance, the credentials were mistakenly uploaded to a service like GitHub). Please note that as the project/account owner, you are responsible for securing your resources.  
Immediate action is required to secure your account(s). We strongly recommend that you take the following steps:
Log in to the Google Cloud Console and review the activity on your account. 
Rotate the credential for the disabled service account. 
Take immediate steps to ensure that your service account credentials are not embedded in public source code systems, stored in download directories or unintentionally shared in other ways.
Learn more about responding to abuse notifications and warnings
The security of your Google Cloud Platform account(s) is important to us. You can find more information on securely using IAM here, and also recommend best practices for keeping service account keys safe. Please let us know if you have additional questi
rm drive-key.json
nano .gitignore
git status
git add .gitignore
git commit -m "Add gitignore to protect sensitive files"
git push
git pull
git config pull.rebase false
git pull
git pull origin main --allow-unrelated-histories
git rm -f drive-key.json
git commit -m "Permanently remove key from tracking"
git push
tropopause_anomaly.txt
nano tropopause_anomaly.txt
sudo apt install gedit -y
gedit tropopause_anomaly.txt &
ls
source bot_env/bin/activate
python3 tornado_agent.py
gedit drive-key.json &
python3 tornado_agent.py
python3 librarian_bot.py
git add .
git commit -m "Add entry on Tropopause Anomaly and Electrostatic Gradient"
git push
gedit tornado_agent.py &
(bot_env) solvingtornadoes@penguin:~$ python3 tornado_agent.py
1]   Done                    gedit tornado_agent.py
solvingtornadoes@penguin:~$ (bot_env) solvingtornadoes@penguin:~$ python3 tornado_agent.py
-bash: syntax error near unexpected token `solvingtornadoes@penguin:~$'
[2]+  Done                    gedit tornado_agent.pysolvingtornadoes@penguin:~$ gedit tornado_agent.py &
[1] 1185
solvingtornadoes@penguin:~$ gedit tornado_agent.py &
[2] 1296
[1]   Done                    gedit tornado_agent.py
solvingtornadoes@penguin:~$ (bot_env) solvingtornadoes@penguin:~$ python3 tornado_agent.py
-bash: syntax error near unexpected token `solvingtornadoes@penguin:~$'
[2]+  Done                    gedit tornado_agent.py
solvingtornadoes@penguin:~$ 1]   Done                    gedit tornado_agent.py
solvingtornadoes@penguin:~$ (bot_env) solvingtornadoes@penguin:~$ python3 tornado_agent.py
-bash: syntax error near unexpected token `solvingtornadoes@penguin:~$'
[2]+  Done                    gedit tornado_agent.pysolvingtornadoes@penguin:~$ (bot_env) solvingtornadoes@penguin:~$ python3 tornado_agent.py
-bash: syntax error near unexpected token `solvingtornadoes@penguin:~$'
[2]+  Done                    gedit tornado_agent.py
solvingtornadoes@penguin:~$ 1]   Done                    gedit tornado_agent.py
solvingtornadoes@penguin:~$ (bot_env) solvingtornadoes@penguin:~$ python3 tornado_agent.py
-bash: syntax error near unexpected token `solvingtornadoes@penguin:~$'
[2]+  Done                    gedit tornado_agent.pysolvingtornadoes@penguin:~$ gedit tornado_agent.py &
[1] 1185
solvingtornadoes@penguin:~$ gedit tornado_agent.py &
[2] 1296
[1]   Done                    gedit tornado_agent.py
solvingtornadoes@penguin:~$ (bot_env) solvingtornadoes@penguin:~$ python3 tornado_agent.py
python3 tornado_agent.py
gedit tornado_agent.py &
