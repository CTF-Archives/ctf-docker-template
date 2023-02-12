FROM python:3.10-bullseye

# 制作者信息
LABEL auther_template="Randark_JMT"

# apt更新源，并安装socta用于端口转发
RUN sed -i "s@http://deb.debian.org@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y socat

# 安装必要的python依赖库
# RUN sage --python -m pip install pycryptodome gmpy2
RUN python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
    pycryptodome 

# 拷贝源码和启动脚本至根目录
COPY ./src/ /app
COPY ./service/docker-entrypoint.sh /

EXPOSE 9999
ENTRYPOINT ["/bin/bash","/docker-entrypoint.sh"]