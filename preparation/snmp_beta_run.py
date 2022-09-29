#!/usr/bin/python3.8

from easysnmp import Session

class Device:
        version = 3

        def __init__(self, ip_oob, snmp3_user='cumulus'):
                self.ip = ip_oob
                self.user = snmp3_user
                self.auth  = "SHA"
                self.priv  = "AES"
                self.pwsha = 'cumulus8password'
                self.pwaes = 'cumulus8encryption'
                self.level = 'auth_with_privacy'

        def getOid(self, oid):
                session = Session( \
                        hostname = self.ip,\
                        version = self.version,\
                        security_level = self.level,\
                        security_username = self.user,\
                        auth_protocol = self.auth,\
                        auth_password = self.pwsha,\
                        privacy_protocol = self.priv,\
                        privacy_password = self.pwaes)
                print("SNMP GET request result: "+session.get(oid).value)


leaf11=Device('192.168.200.2')
leaf12=Device('192.168.200.3')

print('\nSNMPv3 test towards {} using {} for authentication and {} for encryption'.\
                format(leaf11.ip, leaf11.auth, leaf11.priv))

leaf11.getOid('sysName.0')
leaf11.getOid('1.3.6.1.2.1.1.5.0')

print(' \nSNMPv4 test towards {} uding {} für authentication and {} for encryption'.\
                format(leaf12.ip, leaf12.auth, leaf12.priv))

leaf12.getOid('sysName.0')
leaf12.getOid('1.3.6.1.2.1.1.5.0')
