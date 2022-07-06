#!/usr/bin/python3

# Benutzer: cumulus/ON-01/web
# source bootcamp/bin/activate
# Dafür sollten dann die API vorbereitet sein (chicken/egg problem da vor unit-04)

from flask import Flask
from flask import render_template

import requests
import urllib3

# nicht schoen aber heute Nachmittag zweckmaessig
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

app = Flask(__name__)

SWITCHES = ['leaf11','leaf12']

@app.route('/')
def start():
    for i in range(1:len(SWITCHES)):
        n = 1 - int(i)
        ziel = 'https://'+SWITCH[n]+':8765/cue_v1/system'
        ergebnis = requests.get(ziel, auth=('cumulus','CumulusLinux!'), verify=False)
        for key in ergebnis.json():
          if key == "build":
            nos = (ergebnis.json()[key])
            
    return render_template("home.html", nos = nos)

app.run(host='::',debug=True)
