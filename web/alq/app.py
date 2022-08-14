#!/usr/bin/python3

# Benutzer: cumulus/ON-01/web
# source bootcamp/bin/activate
# Die Geraete mit 5.x sollten vorbereitet sein
# Browser: FireFox 101.0.1

from flask import Flask, abort
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
        "slug": "beginn",
    },
    {
        "name": "Hardware & VX",
        "id_feld":   "02",
        "cat":  "base",
        "icon": "/img/thumb_schulung_02.png",
        "slug": "geraete",
    },
    {
        "name": "Out-Of-Band",
        "id_feld":   "03",
        "cat":  "base",
        "icon": "/img/thumb_schulung_03.png",
        "slug": "zugang",
    },
    {
        "name": "NVUE & Co.",
        "id_feld":   "04",
        "cat":  "base",
        "icon": "/img/thumb_schulung_04.png",
        "slug": "befehle"
    }
]

slug_to_project = {project["slug"]: project for project in projects}

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

@app.route('/project/<string:slug>')
def project(slug):
           if slug not in slug_to_project:
               abort(404)
           return render_template(f"project_{slug}.html", project=slug_to_project[slug])
           

app.run(host='::',debug=True)
