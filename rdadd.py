#python -m pip install rd_api_py
#.env
#RD_APITOKEN=""

import os
import requests
import sys
import time
from dotenv import load_dotenv
from rdapi import RD

load_dotenv()
api_key = os.environ['RD_APITOKEN']
headers = {"Authorization": "Bearer " + api_key}

RD = RD()

file = sys.argv[1]
print(RD.torrents.add_file(filepath=file).json())

time.sleep(30)

result = requests.get("https://api.real-debrid.com/rest/1.0/torrents?limit=100", headers=headers)
files = result.json()
for file in files:
    if file["status"] == "waiting_files_selection":
        result = requests.post("https://api.real-debrid.com/rest/1.0/torrents/selectFiles/" + file["id"], data={"files": "all"}, headers=headers)
