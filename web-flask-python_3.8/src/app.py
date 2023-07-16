from flask import Flask

app = Flask(__name__)

Introduction = """
此脚本仅为演示，使用此模板时请移除此文件
此文件实现了 /flag 和 / 两个路由，其中 /flag 直接返回flag
"""


@app.route("/")
def index():
    return "Welcome to CTF-Archives!\n"


@app.route("/flag")
def flag():
    with open("/flag", "r") as f:
        return f.read()
