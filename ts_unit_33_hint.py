#!/usr/bin/python3

import base64

base64_message ='SGludDogUm91dGVyLUlEIG9uIGxlYWZzIGFuZCBBU04gb24gc3BpbmVz'

print(base64_message)

base64_bytes = base64_message.encode('ascii')
message_bytes = base64.b64decode(base64_bytes)
message = message_bytes.decode('ascii')

print(message)
