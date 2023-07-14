# Just a example
import os

Introduction = """
此脚本仅为演示，使用此模板时请移除此文件
此文件做到当选手连接服务，按照说明输入"ctf"之后，输出flag
"""

flag = os.getenv('FLAG')

if __name__ == "__main__":
    while True:
        ins = input("Please input 'ctf':")
        if ins == "ctf":
            print(flag)
            break
    print("Goobye~")
