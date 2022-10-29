#!/usr/bin/python3

# alq, Wittdün 2022

import requests
import urllib3


# not best practice but ok for a LAB-MVP approach
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

TARGET = 'https://192.168.200.2:8765/cue_v1/system'
UP     =  ('cumulus','CumulusLinux!')

nvue_api = requests.get(TARGET,auth=UP, verify=False)

# print(type(nvue_api))
# print(dir(nvue_api))
# print(nvue_api.text)
# print(nvue_api.json())

for key in nvue_api.json():
  if key == "build":
    print("\nNVUE API responded that the used OS Version is: "+nvue_api.json()[key])

print("\n=== Linux Networking Boot Camp 2022 ===\n\n")

