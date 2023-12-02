FROM python:3.10.12-slim-bullseye

# 制作者信息
LABEL auther_template="CTF-Archives"

# apt更换镜像源，并更新软件包列表信息
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update 

# 通过apt，安装xinetd用于服务转发
RUN apt-get install -y socat 

# 通过tuna源，安装必要的python依赖库
# 镜像中并没有更换源，只是在pip语句中每次制定了镜像源
RUN python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
    pycryptodome

# 复制容器启动脚本
COPY ./service/docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# 新建用户，并进行账户改变
RUN useradd -m ctf
WORKDIR /home/ctf

# 部署程序
COPY ./src/server.py /home/ctf/server.py

# [可选]指定对外暴露端口，对于GZCTF等平台，强制EXPOSE可能会造成非预期端口泄露，请酌情启用
# EXPOSE 9999

# 指定容器入口点
ENTRYPOINT ["/bin/sh","/docker-entrypoint.sh"]