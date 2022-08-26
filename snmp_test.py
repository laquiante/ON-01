#!/usr/bin/python3.8

from easysnmp import Session

ip    = '192.168.200.2'
oid   = 'sysName.0'


user  = 'user8'
pwsha = 'user8password'
pwaes = 'user8encryption'

lev   = 'auth_with_privacy'


session = Session(hostname = ip, version = 3 , security_level = lev, security_username = user, auth_protocol = "SHA", auth_password = pwsha, privacy_protocol = "AES", privacy_password = pwaes)

print("SNMP GET: "+session.get(oid).value)
