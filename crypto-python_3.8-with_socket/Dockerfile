FROM python:3.8.18-slim-bullseye

# 制作者信息
LABEL auther_template="CTF-Archives"

# apt更换镜像源，并更新软件包列表信息
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update 

# 通过tuna源，安装必要的python依赖库
# 镜像中并没有更换源，只是在pip语句中每次制定了镜像源
RUN python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
    pycryptodome 

# 拷贝源码和启动脚本至根目录
COPY ./src/ /app
COPY ./service/docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh

# 新建用户，并进行账户改变
RUN useradd -m ctf
RUN chown ctf:ctf /app
USER ctf

EXPOSE 9999

# 指定容器入口点
ENTRYPOINT ["/bin/bash","/app/docker-entrypoint.sh"]