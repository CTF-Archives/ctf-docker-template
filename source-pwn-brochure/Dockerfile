FROM ubuntu:16.04

# 制作者信息
LABEL auther_template="CTF-Archives"

# apt更新，并安装相关依赖
RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list && \
    apt-get update && apt-get -y dist-upgrade && \
    apt-get install -y lib32z1 gcc

# 复制容器启动脚本
COPY ./service/docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# 部署程序，并初始化flag
COPY ./src/ /home/ctf/

# 指定容器入口点
ENTRYPOINT ["/bin/bash","/docker-entrypoint.sh"]
