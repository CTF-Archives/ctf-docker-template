from Crypto.Util.number import *
from hashlib import sha256
import socketserver
import signal
import string
import random

flag = b'flag{test}'

banner = br'''
 __        ___             ____          ____            _                 
 \ \      / / |__  _   _  / ___|  ___   / ___|  ___ _ __(_) ___  _   _ ___ 
  \ \ /\ / /| '_ \| | | | \___ \ / _ \  \___ \ / _ \ '__| |/ _ \| | | / __|
   \ V  V / | | | | |_| |  ___) | (_) |  ___) |  __/ |  | | (_) | |_| \__ \
    \_/\_/  |_| |_|\__, | |____/ \___/  |____/ \___|_|  |_|\___/ \__,_|___/
                   |___/                                                                  
'''

table = string.ascii_letters+string.digits

MENU = br'''
<OPTION>
'''


class Task(socketserver.BaseRequestHandler):
    def _recvall(self):
        BUFF_SIZE = 2048
        data = b''
        while True:
            part = self.request.recv(BUFF_SIZE)
            data += part
            if len(part) < BUFF_SIZE:
                break
        return data.strip()

    def send(self, msg, newline=True):
        try:
            if newline:
                msg += b'\n'
            self.request.sendall(msg)
        except:
            pass

    def recv(self, prompt=b'SERVER <INPUT>: '):
        self.send(prompt, newline=False)
        return self._recvall()

    def handle(self):
        signal.alarm(30)
        self.send(banner)
        self.send(b"\nPlease input the \"ctf\":")
        string = self.recv().decode()
        if string == "ctf":
            self.send(flag)
        self.send(b"\nConnection has been closed  =.=  ")
        self.request.close()


class ThreadedServer(socketserver.ThreadingMixIn, socketserver.TCPServer):
    pass


class ForkedServer(socketserver.ForkingMixIn, socketserver.TCPServer):
    pass


if __name__ == "__main__":
    HOST, PORT = '0.0.0.0', 9999
    print("HOST:POST " + HOST+":" + str(PORT))
    server = ForkedServer((HOST, PORT), Task)
    server.allow_reuse_address = True
    server.serve_forever()
