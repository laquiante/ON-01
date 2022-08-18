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
    },
    {
        "name": "IF and Bridges",
        "id_feld":   "05",
        "cat":  "base",
        "icon": "/img/thumb_schulung_05.png",
        "slug": "schnittstellen"
    },
    {
        "name": "LAG & MLAG",
        "id_feld":   "06",
        "cat":  "base",
        "icon": "/img/thumb_schulung_06.png",
        "slug": "cluster"
    },
    {
        "name": "L3 IF",
        "id_feld":   "07",
        "cat":  "base",
        "icon": "/img/thumb_schulung_07.png",
        "slug": "schicht 3"
    },
    {
        "name": "BGP",
        "id_feld":   "08",
        "cat":  "base",
        "icon": "/img/thumb_schulung_08.png",
        "slug": "MP-BGP"
    }
]


slug_to_project = {project["slug"]: project for project in projects}

app = Flask(__name__)



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

@app.route('/projects/<string:slug>')
def project(slug):
           if slug not in slug_to_project:
               abort(404)

# 18-AUG-2022
               nos = ''
               if slug == 'beginn': 
                 ziel = 'https://192.168.200.2:8765/cue_v1/system'
                 ergebnis = requests.get(ziel, auth=('cumulus','CumulusLinux!'), verify=False)
                 for key in ergebnis.json():
                   if key == "build":
                     nos = (ergebnis.json()[key])        
   
           return render_template(f"project_{slug}.html", project=slug_to_project[slug], nos = nos)
           
@app.errorhandler(404)
def page_nicht_hier(error):
    return render_template("404.html"), 404
        
app.run(host='::',debug=True)
