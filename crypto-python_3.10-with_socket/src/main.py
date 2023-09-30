from Crypto.Util.number import *
from hashlib import sha256
import socketserver
import signal
import os
import string
import random

flag = os.getenv('FLAG')

Introduction = """
此脚本仅为演示，使用此模板时请移除此文件
此文件做到当选手连接服务，按照说明输入"ctf"之后，输出flag
"""

BANNER = br'''
       ____ _____ _____       _             _     _                
      / ___|_   _|  ___|     / \   _ __ ___| |__ (_)_   _____  ___ 
     | |     | | | |_ _____ / _ \ | '__/ __| '_ \| \ \ / / _ \/ __|
     | |___  | | |  _|_____/ ___ \| | | (__| | | | |\ V /  __/\__ \
      \____| |_| |_|      /_/   \_\_|  \___|_| |_|_| \_/ \___||___/
                                                               

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
        self.send(BANNER)
        self.send(b"\nPlease input the \"ctf\":")
        string = self.recv().decode()
        if string == "ctf":
            self.send(flag.encode())
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
