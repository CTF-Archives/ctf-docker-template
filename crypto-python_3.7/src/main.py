# Just a example
import os
import pty

flag = os.getenv('FLAG')

while True:
    ins = input("Please input 'ctf':")
    if ins == "ctf":
        print(flag)
        pty.spawn("/bin/bash")
        break
