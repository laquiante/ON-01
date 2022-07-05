#!/usr/bin/python3

# Benutzer: cumulus im Home-Verzeichnis
# source bootcamp/bin/activate
# Dafür sollten dann die API vorbereitet sein

from flask import Flask
from flask import render_template

import requests
import urllib3

# nicht schoen aber heute Nachmittag zweckmaessig
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

app = Flask(__name__)

@app.route('/')
def start():
    ergebnis = requests.get('https://192.168.200.2:8765/cue_v1/system', auth=('cumulus','Academy123'), verify=False)
    for key in ergebnis.json():
      if key == "build":
        NOS = ergebnis.json()[key]
    return NOS

app.run(host='::',debug=True)
