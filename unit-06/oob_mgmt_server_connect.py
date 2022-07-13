import requests
import urllib3
import pprint

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


def test_spine23():
# 192.168.200.11:8765/cue_v1/interface
    ziel = 'https://192.168.200.11:8765/cue_v1/interface'
    ergebnis = requests.get(ziel, auth=('cumulus','CumulusLinux!'), verify=False)
    for key in ergebnis.json():
        pprint.pprint(ergebnis.json()[key])



if __name__ == "__main__":

    test_spine23()
