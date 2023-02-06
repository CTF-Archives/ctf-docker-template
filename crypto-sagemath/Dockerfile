FROM sagemath/sagemath

# 制作者信息
LABEL auther_template="Randark_JMT"

# apt更新源，并安装socta用于端口转发
# RUN sed -i "s@http://deb.debian.org@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
RUN sudo apt-get update 
RUN sudo apt-get install -y socat

# 安装必要的python依赖库
# RUN sage --python -m pip install pycryptodome gmpy2
RUN sage --python -m pip install pycryptodome gmpy2 -i https://pypi.tuna.tsinghua.edu.cn/simple

# 拷贝源码和启动脚本至根目录
COPY ./src/main.sage /home/sage
COPY ./service/docker-entrypoint.sh /

EXPOSE 9999
ENTRYPOINT ["/bin/bash","/docker-entrypoint.sh"]