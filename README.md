# ON-01

Assumption-01: All devices run the intendet NOS in the intendet version (esp. spine23)

Assumption-02: All hosts (ubuntu 20.04) have a user "cumulus" (password "Academy123") setup for passwordless ssh

Assumption-03: All switches have the user "cumulus" (password "CumulusLinux!") setup for passwordless ssh and sudo priv.

Assumption-04: The oob-mgmt-server expects a password change at first login (old password: "nvidia", new password "Academy123")

Assumption-05: The oob-mgmt-server reuses the key-material of user "ubuntu" for the to be added user "cumulus" (password "Academy123")

Assumption-06: For ease of use or convenience a direct ssh connection to hte oob-mgmt-server with the user cumulus should be provided

Assumption-07: Python 3.6.9 is availalbe on hte oob-mgmt-server

Assumption-08: venv is availalbe (installed), a direktory cl_expert is created and venv "bootcamp" activated

Assumption-09: within (bootcamp) the following are available Python 3.6.9, Flask 2.0.3 and Werkzeug 2.0.3

Assuption-10: rsa keys are available in a format paramiko expects

Assumption-11: needed directories are owned by cumulus:cumulus

Assumption-12: the webserver is able to serve needed images (e.g. cumulus-linux 5.1.0)

Assumption-13: leaf, spine, and wan switches use 5.1.0 along with NVUE and the externally exposed API, 
router01, router02, and customer01 are using 4.x and will be configured via IP(route2), hosts are using 20.04 and enjoy netplan






