# Just a example
import os
import pty

Introduction = """
此脚本仅为演示，使用此模板时请移除此文件
此文件做到当选手连接服务，按照说明输入"ctf"之后，输出flag
然后启动一个shell，并将shell转发给选手的连接
"""

flag = os.getenv('FLAG')

if __name__ == "__main__":
    while True:
        ins = input("Please input 'ctf':")
        if ins == "ctf":
            print(flag)
            pty.spawn("/bin/bash")
            break
    print("Goobye~")
