#!/usr/bin/python3

# Benutzer: cumulus/ON-01/web
# source bootcamp/bin/activate
# Die Geraete mit 5.x sollten vorbereitet sein

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
    return render_template("home.html", Zeiger = 0)

@app.route('/unit-01')
def start():   
    return render_template("home.html", Zeiger = 1)


app.run(host='::',debug=True)
