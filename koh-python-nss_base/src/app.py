from math import log
from flask import Flask, request, jsonify
# import subprocess
import hashlib

app = Flask(__name__)

@app.route('/upload', methods=['POST'])
def upload():
    file = request.files.get('file', None)
    
    if file is None:
        return jsonify({'code': 201})

    #----- 对文件的处理部分 -----# 
    file.save('/home/ctf/submit.py')

    #----- 状态返回 -----#
    return jsonify({'code': 200})

@app.route('/check', methods=['POST'])
def check():

    #----- 评判部分的操作代码 -----#

    with open('/home/ctf/submit.py', 'rb') as f:
        h = hashlib.md5(f.read()).hexdigest()

    ''' 使用subprocess建立chroot沙盒的方式进行执行:
    
    p = subprocess.Popen(['/usr/sbin/chroot', '--userspec=1000:1000', '/home/ctf', 'python', 'submit.py'],
                     stdout=subprocess.PIPE,
                     stderr=subprocess.STDOUT)

    out, _ = p.communicate(timeout=10)

    '''
    
    flag = 0xe77b9e003d909716b0609604fcc02f52

    try:
        out = int(h, 16)
    except:
        return jsonify({'code': 200, 'score': 0})

    if out == flag:
        return jsonify({'code': 200, 'score': 0})
    
    delta = abs(flag - out)
    score = round(500 - log(delta)*6)
    
    if score < 0:
        score = 0
    return jsonify({'code': 200, 'score': score})

app.run(host='0.0.0.0',debug=False)