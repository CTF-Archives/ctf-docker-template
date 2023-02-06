# Just a example
from Crypto.Util.number import *
import os

flag = os.getenv('FLAG')

while True:
    ins = input("Please input 'ctf':")
    if ins == "ctf":
        print(flag)
