#!/bin/env python
# coding=utf-8

import os

SERVER_PORT = os.getenv('SERVER_PORT', 4123)
METHOD = os.getenv('METHOD', 'chacha20')
PASS = os.getenv('PASS', 'public')

os.system('ssserver -p {} -k {} -m {}'.format(SERVER_PORT, PASS, METHOD))

