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


einheiten = [
    {
        "name": "Introduction"
        "id":   "01"
        "cat":  "base"
        "icon": "/img/test.png"
    },
    {
        "name": "Hardware & VX"
        "id":   "02"
        "cat":  "base"
        "icon": "/img/test.png"
    }
]

app = Flask(__name__)

SWITCHES = ['leaf11','leaf12']

@app.route('/')
def units():   
    return render_template("units.html")

@app.route('/topology')
def topology():   
    return render_template("topology.html")

@app.route('/about')
def about():   
    return render_template("about.html")

@app.route('/contact')
def contact():   
    return render_template("contact.html")

app.run(host='::',debug=True)
