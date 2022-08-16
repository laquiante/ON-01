#!/usr/bin/python3

# Benutzer: cumulus/ON-01/web
# source bootcamp/bin/activate
# Die Geraete mit 5.x sollten vorbereitet sein
# Browser: FireFox 101.0.1

from flask import Flask, abort
from flask import render_template

import requests
import urllib3
import ast

# nicht schoen aber heute Nachmittag zweckmaessig
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


slug_to_project = {project["slug"]: project for project in projects}

app = Flask(__name__)

with open('project.txt') as f:
    projects = ast.literal_eval(f.read())
    
print(projects)

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
           return render_template(f"project_{slug}.html", project=slug_to_project[slug])
           
@app.errorhandler(404)
def page_nicht_hier(error):
    return render_template("404.html"), 404
        
app.run(host='::',debug=True)
