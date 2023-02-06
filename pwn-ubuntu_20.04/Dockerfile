FROM ubuntu:20.04

# 制作者信息
LABEL auther_template="Randark_JMT"

# apt更新，并安装相关依赖
RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list && \
    apt-get update && apt-get -y dist-upgrade && \
    apt-get install -y lib32z1 xinetd

# 新建用户，并进行权限限制
RUN useradd -m ctf

WORKDIR /home/ctf

# 复制相关glibc，并处理环境
RUN cp -R /usr/lib* /home/ctf

RUN mkdir /home/ctf/dev && \
    mknod /home/ctf/dev/null c 1 3 && \
    mknod /home/ctf/dev/zero c 1 5 && \
    mknod /home/ctf/dev/random c 1 8 && \
    mknod /home/ctf/dev/urandom c 1 9 && \
    chmod 666 /home/ctf/dev/*

RUN mkdir /home/ctf/bin && \
    cp /bin/sh /home/ctf/bin && \
    cp /bin/ls /home/ctf/bin && \
    cp /bin/cat /home/ctf/bin && \
    cp /usr/bin/timeout /home/ctf/bin

# 部署xinetd服务
COPY ./service/ctf.xinetd /etc/xinetd.d/ctf
RUN echo "Blocked by ctf_xinetd" > /etc/banner_fail

# 复制容器启动脚本
COPY ./service/docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# 部署程序，并初始化flag
COPY ./src/ /home/ctf/
RUN chown -R root:ctf /home/ctf && \
    chmod -R 750 /home/ctf && \
    touch /home/ctf/flag && \
    chmod 777 /home/ctf/flag

EXPOSE 9999
ENTRYPOINT ["/bin/bash","/docker-entrypoint.sh"]

