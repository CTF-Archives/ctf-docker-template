# Just a example
from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    with open("/flag","r") as f:
        flag=f.read()
    return flag