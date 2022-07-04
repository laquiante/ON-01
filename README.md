# ON-01

Assumption-01: All devices run the intendet NOS in the intendet version

Assumption-02: All hosts (ubuntu 20.04) have a user "cumulus" (password "Academy123") setup for passwordless ssh

Assumption-03: All switches have the user "cumulus" (password "CumulusLinux!") setup for passwordless ssh and sudo priv.

Assumption-04: The oob-mgmt-server expects a password change at first login (old password: "nvidia", new password "Academy123")

Assumption-05: The oob-mgmt-server reuses the key-material of user "ubuntu" for the to be added user "cumulus" (password "Academy123")

Assumption-06: For ease of use or convenience a direct ssh connection to hte oob-mgmt-server with the user cumulus should be provided

Assumption-07: Python 3.6.9 is availalbe on hte oob-mgmt-server

Assumption-08: venv is availalbe (installed), a direktory cl_expert is created and venv "bootcamp" activated



