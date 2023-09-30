# Just a example
import os

Introduction = """
此脚本仅为演示，使用此模板时请移除此文件
此文件做到当选手连接服务，按照说明输入"ctf"之后，输出flag
"""

flag = os.getenv('FLAG')

BANNER = r'''
       ____ _____ _____       _             _     _                
      / ___|_   _|  ___|     / \   _ __ ___| |__ (_)_   _____  ___ 
     | |     | | | |_ _____ / _ \ | '__/ __| '_ \| \ \ / / _ \/ __|
     | |___  | | |  _|_____/ ___ \| | | (__| | | | |\ V /  __/\__ \
      \____| |_| |_|      /_/   \_\_|  \___|_| |_|_| \_/ \___||___/
                                                               

'''

if __name__ == "__main__":
    print(BANNER)
    while True:
        ins = input("Please input 'ctf':")
        if ins == "ctf":
            print(flag)
            break
    print("Goobye~")
