#!/usr/bin/python3

# Benutzer: cumulus/ON-01/web
# source bootcamp/bin/activate
# Die Geraete mit 5.x sollten vorbereitet sein
# Browser: FireFox 101.0.1

from flask import Flask
from flask import render_template

import requests
import urllib3

# nicht schoen aber heute Nachmittag zweckmaessig
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


projects = [
    {
        "name": "Introduction",
        "id_feld":   "01",
        "cat":  "base",
        "icon": "/img/thumb_schulung_01.png",
    },
    {
        "name": "Hardware & VX",
        "id_feld":   "02",
        "cat":  "base",
        "icon": "/img/thumb_schulung_02.png",
    },
    {
        "name": "03",
        "id_feld":   "03",
        "cat":  "base",
        "icon": "/img/thumb_schulung_03.png",
    },
    {
        "name": "Vier",
        "id_feld":   "04",
        "cat":  "base",
        "icon": "/img/thumb_schulung_04.png",
    }
]

app = Flask(__name__)

SWITCHES = ['leaf11','leaf12']

@app.route('/')
def units():   
    return render_template("units.html", projects=projects)

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
