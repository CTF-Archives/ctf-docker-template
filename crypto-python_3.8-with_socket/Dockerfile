FROM ubuntu:20.04

# 制作者信息
LABEL auther_template="Randark_JMT"

# apt更换镜像源，并更新软件包列表信息
RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list && \
    sed -i 's@//.*security.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list
RUN apt-get update 

# 通过apt，安装基础环境Python 3.8，安装socat用于服务转发
RUN apt-get install -y python3.8 python3-pip

# 通过tuna源，安装必要的python依赖库
# 镜像中并没有更换源，只是在pip语句中每次制定了镜像源
RUN python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
    pycryptodome 

# 拷贝源码和启动脚本至根目录
COPY ./src/ /app
COPY ./service/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# [可选]指定对外暴露端口，对于GZCTF等平台，强制EXPOSE可能会造成非预期端口泄露，请酌情启用
# EXPOSE 9999

# 指定容器入口点
ENTRYPOINT ["/bin/bash","/docker-entrypoint.sh"]